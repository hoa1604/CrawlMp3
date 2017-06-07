using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using HtmlAgilityPack;
using HtmlDocument = HtmlAgilityPack.HtmlDocument;

namespace CrawlMp3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Khai báo đường dẫn URL web cần lấy nội dung HTML
            string _url = txtNhap.Text;

            //Khởi tạo 1 đối tượng htmlWeb, có thể hiểu đối tượng này như 1 trình duyệt ảo
            HtmlAgilityPack.HtmlWeb htmlWeb = new HtmlAgilityPack.HtmlWeb();
            //Set UserAgent string để máy chủ web biết là mình truy cập bằng trình duyệt gì 
            //Hữu ích khi bạn cần lấy nội dung HTML phiên bản mobile hay desktop
            //Danh sách useragent string http://www.useragentstring.com/pages/useragentstring.php
            htmlWeb.UserAgent = "Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0";
          
            try
            {
                //Khai báo đối tượng htmlDoc chứa nội dung HTML sẽ tải về
                HtmlAgilityPack.HtmlDocument htmlDoc = htmlWeb.Load(_url);
                string _html = htmlDoc.DocumentNode.InnerHtml; //lưu nội dung HTML vào biến _html
                

                HtmlDocument html = new HtmlDocument();
                html.OptionFixNestedTags = true;
                html.OptionCheckSyntax = false;
                html.LoadHtml(_html); //responseString là đoạn html mà bạn lấy được ở phần trước.
                string titleNodes = htmlDoc.DocumentNode.SelectSingleNode("//h1[@class='viewtitle']").InnerHtml;
                string[] titleString = titleNodes.Split('-');
                txtBaiHat.Text = titleString[0];
                txtCaSi.Text = titleString[1];
                var nodes = htmlDoc.DocumentNode.SelectNodes("//script[@type='text/javascript' and contains(.,'$(document).ready')]");
                foreach (HtmlNode node in nodes)
                {
                    var title = node.InnerText; // Tiêu đề bài viết muốn lấy.
                    string[] chuoi = title.Split('{');
                    string[] ch = chuoi[3].Split('"');
                    txtLinkNhac.Text = ch[3];
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        //lấy thẻ meta
        //foreach (HtmlNode node in nodes)
        //{
        //    if ((node.Attributes["property"] != null) & (node.Attributes["content"] != null))
        //    {
        //        if (node.Attributes["property"].Value == "og:title")
        //        {
        //            albumName = node.Attributes["content"].Value;
        //        }
        //    }
        //    else
        //    {
        //        albumName = "Không tìm được tên album!";
        //    }

        //}
    }
}
