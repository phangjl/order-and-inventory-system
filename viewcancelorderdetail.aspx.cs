using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cassandra;
using Cassandra.Data.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;
using System.IO;

namespace WebApplication1
{
    public partial class viewcancelorderdetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

              
                var id = Request.QueryString["id"];
              //  int id = 5;
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                // Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");
                string q = string.Format("select order_id, cust_id, order_date, staff_name, add_from, add_to ,status, total_price  from orders where order_id = {0} ", id);
                var order_record = session.Execute(q).First();

                string order_id = order_record.GetValue<int>(0).ToString();
                int cust_id = order_record.GetValue<int>(1);
                string order_date = order_record.GetValue<LocalDate>(2).ToString();
                string staff_name = order_record.GetValue<string>(3);
                string add_from = order_record.GetValue<string>(4);
                string add_to = order_record.GetValue<string>(5);
                string status = order_record.GetValue<string>(6);
                double total_price = order_record.GetValue<double>(7);

                string q1 = string.Format("select name , email from customer where cust_id = {0}", cust_id);
                var cust_record = session.Execute(q1).First();
                string name = cust_record.GetValue<string>(0);
                string email = cust_record.GetValue<string>(1);




                string q2 = string.Format("select product_id, qty, sell_price, disc, subtotal from orders_details where order_id  = {0} allow filtering ", id);
                RowSet ord_detail_record = session.Execute(q2);
                this.Session["nooforder"] = ord_detail_record.Count();


                var Ordertable = new Table<Orders_details>(session);
                List<int> record0 = (from s in Ordertable select s.order_id).Execute().ToList();
                List<int> record1 = (from s in Ordertable select s.product_id).Execute().ToList();
                List<int> record2 = (from s in Ordertable select s.qty).Execute().ToList();
                List<double> record3 = (from s in Ordertable select s.sell_price).Execute().ToList();
                List<double> record4 = (from s in Ordertable select s.disc).Execute().ToList();
                List<double> record5 = (from s in Ordertable select s.subtotal).Execute().ToList();
                List<string> record6 = new List<string>();

                this.Session["selected"] = int.Parse(id);
                //this.Session["selected"] = id;
                this.Session["allorderid"] = record0;
                this.Session["allpdid"] = record1;
                this.Session["allqty"] = record2;
                this.Session["allsellp"] = record3;
                this.Session["alldisc"] = record4;
                this.Session["allsubtt"] = record5;



                var prodtable = new Table<product>(session);
                List<int> row = (from s in prodtable select s.product_id).Execute().ToList();
                List<string> row1 = (from s in prodtable select s.product_name).Execute().ToList();
                for (int i = 0; i < record1.Count(); i++)
                {
                    for (int j = 0; j < row.Count(); j++)
                    {
                        if (record1[i] == row[j])
                        {
                            record6.Add(row1[j]);
                        }
                    }

                }


                this.Session["allpdid"] = record6;

                Label40.Text = order_id;
                Label41.Text = name;
                Label42.Text = email;
                Label43.Text = staff_name;
                Label44.Text = order_date;
                Label45.Text = add_from;
                Label46.Text = add_to;
                Label47.Text = status;
                totalamount.Text = string.Format("{0:0.00}", total_price);



            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewcancelorder.aspx");
        }


        public class product
        {

            public int product_id { get; set; }
            public string product_name { get; set; }
        }

        public class Orders_details
        {
            public int order_id { get; set; }
            public int product_id { get; set; }
            public int qty { get; set; }
            public double sell_price { get; set; }
            public double disc { get; set; }
            public double subtotal { get; set; }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            createpdf();
        }


        public void createpdf()
        {
            Document document = new Document(PageSize.A4, 10, 10, 10, 10);

            string reportname = string.Format("order_detail_0{0}.pdf", Label40.Text);
            PdfWriter.GetInstance(document, new FileStream(Server.MapPath(reportname), FileMode.Create));

            document.Open();


            string text = "Customer Order Detail";
            Paragraph paragraph = new Paragraph();
            paragraph.SpacingBefore = 10;
            paragraph.SpacingAfter = 8;
            paragraph.Alignment = Element.ALIGN_CENTER;
            paragraph.Font = FontFactory.GetFont(FontFactory.HELVETICA, 12f, BaseColor.BLACK);
            paragraph.Add(text);
            document.Add(paragraph);

            PdfPTable tableLayout1 = new PdfPTable(2);
            document.Add(Add_Content_To_PDF1(tableLayout1));

            string text1 = "";
            Paragraph paragraph1 = new Paragraph();
            paragraph1.SpacingBefore = 10;
            paragraph1.SpacingAfter = 8;
            paragraph1.Alignment = Element.ALIGN_CENTER;

            paragraph1.Add(text1);
            document.Add(paragraph1);

            PdfPTable tableLayout = new PdfPTable(5);

            document.Add(Add_Content_To_PDF(tableLayout));
            document.Close();



        }



        private PdfPTable Add_Content_To_PDF1(PdfPTable tableLayout)
        {
            float[] headers = { 30, 70 }; //Header Widths  
            tableLayout.SetWidths(headers); //Set the pdf headers  
            tableLayout.WidthPercentage = 80; //Set the PDF File witdh percentage  


            //Add body  
            AddCellToBody1(tableLayout, "Order ID");
            AddCellToBody1(tableLayout, Label40.Text);
            AddCellToBody1(tableLayout, "Customer");
            AddCellToBody1(tableLayout, Label41.Text);
            AddCellToBody1(tableLayout, "E-mail Address");
            AddCellToBody1(tableLayout, Label42.Text);
            AddCellToBody1(tableLayout, "Salesperson");
            AddCellToBody1(tableLayout, Label43.Text);
            AddCellToBody1(tableLayout, "Order Date");
            AddCellToBody1(tableLayout, Label44.Text);
            AddCellToBody1(tableLayout, "From");
            AddCellToBody1(tableLayout, Label45.Text);
            AddCellToBody1(tableLayout, "Ship To");
            AddCellToBody1(tableLayout, Label46.Text);
            AddCellToBody1(tableLayout, "Status");
            AddCellToBody1(tableLayout, Label47.Text);

            return tableLayout;
        }

        private static void AddCellToBody1(PdfPTable tableLayout, string cellText)
        {
            iTextSharp.text.Font fontTinyItalic = FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD, BaseColor.BLACK);
            tableLayout.AddCell(new PdfPCell(new Phrase(cellText, fontTinyItalic))
            {
                HorizontalAlignment = Element.ALIGN_LEFT,
                Padding = 2,

            });
        }



        private PdfPTable Add_Content_To_PDF(PdfPTable tableLayout)
        {
            float[] headers = { 20, 20, 20, 20, 20, }; //Header Widths  
            tableLayout.SetWidths(headers); //Set the pdf headers  
            tableLayout.WidthPercentage = 80; //Set the PDF File witdh percentage  
                                              //Add Title to the PDF file at the top  

            //Add header  
            AddCellToHeader(tableLayout, "Porduct");
            AddCellToHeader(tableLayout, "Quantity");
            AddCellToHeader(tableLayout, "Unit Price (RM)");
            AddCellToHeader(tableLayout, "Discount (%)");
            AddCellToHeader(tableLayout, "Subtotal (RM)");
            //Add body  
            List<int> record = (List<int>)this.Session["allorderid"];
            List<string> record1 = (List<string>)this.Session["allpdid"];
            List<int> record2 = (List<int>)this.Session["allqty"];

            List<double> record3 = (List<double>)this.Session["allsellp"];
            List<double> record4 = (List<double>)this.Session["alldisc"];
            List<double> record5 = (List<double>)this.Session["allsubtt"];

            for (int i = 0; i < record.Count(); i++)
            {
                if (record[i] == (int)this.Session["selected"])
                {

                    AddCellToBody(tableLayout, record1[i].ToString());
                    AddCellToBody(tableLayout, record2[i].ToString());
                    AddCellToBody(tableLayout, string.Format("{0:0.00}", record3[i]));
                    AddCellToBody(tableLayout, record4[i].ToString());
                    AddCellToBody(tableLayout, string.Format("{0:0.00}", record5[i]));

                }
            }



            AddCellToBody(tableLayout, "");
            AddCellToBody(tableLayout, "");
            AddCellToBody(tableLayout, "");
            AddCellToBody(tableLayout, "Total (RM)");
            AddCellToBody(tableLayout, totalamount.Text);



            return tableLayout;
        }
        // Method to add single cell to the header  
        private static void AddCellToHeader(PdfPTable tableLayout, string cellText)
        {
            iTextSharp.text.Font fontTinyItalic = FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD, BaseColor.WHITE);
            tableLayout.AddCell(new PdfPCell(new Phrase(cellText, fontTinyItalic))
            {
                HorizontalAlignment = Element.ALIGN_CENTER,
                Padding = 5,

                BackgroundColor = BaseColor.BLACK,

            });
        }
        // Method to add single cell to the body  
        private static void AddCellToBody(PdfPTable tableLayout, string cellText)
        {
            iTextSharp.text.Font fontTinyItalic = FontFactory.GetFont("Arial", 7, BaseColor.BLACK);
            tableLayout.AddCell(new PdfPCell(new Phrase(cellText, fontTinyItalic))
            {
                HorizontalAlignment = Element.ALIGN_LEFT,
                Padding = 5,

            });
        }


    }
}