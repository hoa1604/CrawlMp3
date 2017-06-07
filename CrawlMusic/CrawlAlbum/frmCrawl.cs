using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using CrawlAlbum.Entity;
using HtmlAgilityPack;
using HtmlDocument = HtmlAgilityPack.HtmlDocument;

namespace CrawlAlbum
{
    public partial class frmCrawl : Form
    {
        CrawlEntities db = new CrawlEntities();
        struct Album
        {
            public string song;
            public string singer;
            public string link;
        };
        List<Album> album = new List<Album>();
        public frmCrawl()
        {
            InitializeComponent();
        }
        public HtmlDocument ReadLink(string url)
        {
            HtmlAgilityPack.HtmlWeb htmlWeb = new HtmlAgilityPack.HtmlWeb();
            htmlWeb.UserAgent = "Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0";
            HtmlAgilityPack.HtmlDocument htmlDoc = htmlWeb.Load(url);
            return htmlDoc;
        }
        public void CrawlAlbum(HtmlDocument htmlDoc)
        {
            //đoạn code này để xem mã HTML
            //HtmlAgilityPack.HtmlDocument html = new HtmlDocument();
            //html.OptionFixNestedTags = true;
            //html.OptionCheckSyntax = false;
            //string _html = htmlDoc.DocumentNode.InnerHtml;
            //html.LoadHtml(_html);
            var nodes = htmlDoc.DocumentNode.SelectNodes("//div[@class='item_content']");
            foreach (HtmlNode node in nodes)
            {
                var title = node.InnerText; // Tiêu đề bài viết muốn lấy.
                string[] chuoi = title.Split('-');
                Album abl = new Album();
                abl.song = chuoi[0];
                abl.singer = chuoi[1];
                album.Add(abl);
            }
        }
        public string CrawlTitle(HtmlDocument htmlDoc)
        {
            string albumName = null;
            var nodes = htmlDoc.DocumentNode.SelectNodes("//h1[@itemprop='name']");
            foreach (HtmlNode item in nodes)
            {
                albumName = item.InnerText;
            }
            return albumName;
        }
        private void frmCrawl_Load(object sender, EventArgs e)
        {
            
        }


        //DÙNG XML

        //lấy đoạn mã xml
        public string LoadXml(string url)
        {
            using (WebClient client = new WebClient())
            {

                client.Encoding = Encoding.UTF8;
                client.Headers.Add(HttpRequestHeader.UserAgent, "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36");
                //lấy sourse Html
                string Html = client.DownloadString(url);
                //lấy link xmlURL
                string urlmp3 = Regex.Match(Html, @"xmlURL = ""(.+?)""", RegexOptions.IgnoreCase).Groups[1].Value.Trim();
                //lấy mã nguồn trang xml
                string xmlSoure = client.DownloadString(urlmp3);
                return xmlSoure;
            }
        }

        //bóc tách xml
        public void CrawlXml(string xmlSoure)
        {
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xmlSoure);
            XmlNodeList node1 = doc.SelectNodes("/tracklist/track");
            foreach (XmlNode item in node1)
            {
                Album abl = new Album();
                abl.song = item["title"].InnerText;
                abl.singer = item["creator"].InnerText;
                abl.link = item["location"].InnerText;
                album.Add(abl);
            }
        }

        //insert vào DB
        private void InsertData()
        {
            ListAlbum newAlbum = new ListAlbum();
            newAlbum.name = labTen.Text;
            newAlbum.link = txtNhap.Text;
            int albumId = newAlbum.id;
            db.ListAlbums.Add(newAlbum);
            foreach (var item in album)
            {
                AlbumDetail detail = new AlbumDetail();
                // detail.idAlbum = int.Parse(db.ListAlbums.Max(s => s.id).ToString());
                detail.idAlbum = albumId;
                detail.song = item.song;
                detail.singer = item.singer;
                detail.link = item.link;
                db.AlbumDetails.Add(detail);
            }
            db.SaveChanges();
        }

        private void ShowData(int AlbumId)
        {
            var query = from s in db.AlbumDetails
                        where s.idAlbum == AlbumId
                        select new { song = s.song, singer = s.singer, link = s.link };
            dgvDanhSach.DataSource = query.ToList();
            for (int i = 0; i < query.Count(); i++)
            {
                dgvDanhSach.Rows[i].HeaderCell.Value = (i + 1).ToString();
            }
            dgvDanhSach.Columns[0].HeaderText = "Tên bài hát";
            dgvDanhSach.Columns[1].HeaderText = "Ca sĩ thể hiện";
            dgvDanhSach.Columns[2].HeaderText = "Link nhạc mp3";
            dgvDanhSach.Columns[2].Width = 300;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            //dùng bằng html
            //HtmlDocument htmlDoc = ReadLink(txtNhap.Text);
            //string albumName = CrawlTitle(htmlDoc);
            //CrawlAlbum(htmlDoc);
            //album.Clear();


            //dùng bằng xml
           
            //kiểm tra nếu có trong DB thì đổ lên từ DB
            int id = 0;
            var query = from s in db.ListAlbums where s.link.Contains(txtNhap.Text) select new { s.id, s.name };
            foreach (var item in query)
            {
                labTen.Text = item.name;
                id = item.id;
            }
            if (id != 0)
            {
                ShowData(id);
            }
            else
            {
                //crawl trực tiếp
                HtmlDocument htmlDoc = ReadLink(txtNhap.Text);
                string xmlSoure = LoadXml(txtNhap.Text);
                labTen.Text = CrawlTitle(htmlDoc);
                CrawlXml(xmlSoure);
                InsertData();
                int albumId = int.Parse(db.ListAlbums.Max(s => s.id).ToString());
                ShowData(albumId);
                album.Clear();
            }
        }
    }
}
