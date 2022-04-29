using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cassandra;
using Cassandra.Data.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;

namespace WebApplication1
{
    public partial class createorder : System.Web.UI.Page
    {      


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                int noOfprocd = 1;
                this.Session["noOfprocd"] = noOfprocd;

                
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");

                //string query = "select * from staff where username=" + (string)txtuser.Text;
                string q = string.Format("select max(order_id) from orders");
                var order_id = session.Execute(q).First();
                txtordid.Text = (order_id.GetValue<int>(0) +1).ToString();

                string q1 = string.Format("select name from customer");
                RowSet rs_cusname = session.Execute(q1);
                foreach(var row in rs_cusname) {
                    string item = row.GetValue<string>(0);
                    drpcus.Items.Add(item);
                }

                

                string q2 = string.Format("select * from product");
                  int numberofproduct = session.Execute(q2).Count();
                  this.Session["noOfprocd1"] = numberofproduct;
                
                string q3 = string.Format("select product_name from product");
                RowSet rs_prodname = session.Execute(q3);
                foreach (var row in rs_prodname)
                {
                    string item = row.GetValue<string>(0);
                    DropDownList1.Items.Add(item);
                }

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ordermenupage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");
            string q3 = string.Format("select product_name from product");
            RowSet rs_prodname = session.Execute(q3);

            int noOfprocd = (int)this.Session["noOfprocd"];
            int noOfprocd1 = (int)this.Session["noOfprocd1"];
            if (noOfprocd != 5 && noOfprocd != noOfprocd1) {
                this.Session["noOfprocd"] = noOfprocd + 1;
                if ((int) this.Session["noOfprocd"] == 2) {
                    foreach (var row in rs_prodname)
                    {
                        string item = row.GetValue<string>(0);
                        if(!item.Equals(DropDownList1.SelectedValue))
                           DropDownList2.Items.Add(item);
                    }
                }
                if ((int)this.Session["noOfprocd"] == 3)
                {
                    foreach (var row in rs_prodname)
                    {
                        string item = row.GetValue<string>(0);
                        if ( (!item.Equals(DropDownList1.SelectedValue))&& (!item.Equals(DropDownList2.SelectedValue)))
                            DropDownList3.Items.Add(item);
                    }
                }
                if ((int)this.Session["noOfprocd"] == 4)
                {
                    foreach (var row in rs_prodname)
                    {
                        string item = row.GetValue<string>(0);
                        if ((!item.Equals(DropDownList1.SelectedValue)) && (!item.Equals(DropDownList2.SelectedValue))&& (!item.Equals(DropDownList4.SelectedValue)))
                            DropDownList4.Items.Add(item);
                    }
                }
                if ((int)this.Session["noOfprocd"] == 5)
                {
                    foreach (var row in rs_prodname)
                    {
                        string item = row.GetValue<string>(0);
                        if ((!item.Equals(DropDownList1.SelectedValue)) && (!item.Equals(DropDownList2.SelectedValue)) && (!item.Equals(DropDownList4.SelectedValue)) && (!item.Equals(DropDownList5.SelectedValue)))
                            DropDownList5.Items.Add(item);
                    }
                }
            }
    
           
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int noOfprocd = (int)this.Session["noOfprocd"];
            if (noOfprocd != 1)
            {
                this.Session["noOfprocd"] = noOfprocd - 1;
            }
        }

        protected void drpcus_SelectedIndexChanged(object sender, EventArgs e)
        {
            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");

            string q = string.Format("select email from customer where name = '{0}' allow filtering", drpcus.SelectedValue);
            var order_id = session.Execute(q).First();
            txtemail.Text = (order_id.GetValue<string>(0)).ToString();

        }

        protected void dics1_TextChanged(object sender, EventArgs e)
        {
            if (qty1.Text != "" && price1.Text != "" && dics1.Text != "") {

                subtotal1.Text = string.Format("{0:0.00}", (double)(double.Parse(qty1.Text) * double.Parse(price1.Text)) - (double.Parse(qty1.Text) * double.Parse(price1.Text) * (double.Parse(dics1.Text) / 100)));
                total();
            }
        }

        protected void dics2_TextChanged(object sender, EventArgs e)
        {
            if (qty2.Text != "" && price2.Text != "" && dics2.Text != "")
            {

                
                subtotal2.Text = string.Format("{0:0.00}", (double)(double.Parse(qty2.Text) * double.Parse(price2.Text)) - (double.Parse(qty2.Text) * double.Parse(price2.Text) * (double.Parse(dics2.Text) / 100)));
                total();
            }
        }

        protected void dics3_TextChanged(object sender, EventArgs e)
        {
            if (qty3.Text != "" && price3.Text != "" && dics3.Text != "")
            {

                subtotal3.Text = string.Format("{0:0.00}", (double)(double.Parse(qty3.Text) * double.Parse(price3.Text)) - (double.Parse(qty3.Text) * double.Parse(price3.Text) * (double.Parse(dics3.Text) / 100)));
                total();
            }
        }

   
        protected void dics4_TextChanged(object sender, EventArgs e)
        {
            if (qty4.Text != "" && price4.Text != "" && dics4.Text != "")
            {

                subtotal4.Text = string.Format("{0:0.00}", (double)(double.Parse(qty4.Text) * double.Parse(price4.Text)) - (double.Parse(qty4.Text) * double.Parse(price4.Text) * (double.Parse(dics4.Text) / 100)));
                total();
            }
        }

        protected void dics5_TextChanged(object sender, EventArgs e)
        {
            if (qty5.Text != "" && price5.Text != "" && dics5.Text != "")
            {

                subtotal5.Text = string.Format("{0:0.00}", (double)(double.Parse(qty5.Text) * double.Parse(price5.Text)) - (double.Parse(qty5.Text) * double.Parse(price5.Text) * (double.Parse(dics5.Text) / 100)));
                total();
            }
        }


        public void total() {
            int noOfprocd = (int)this.Session["noOfprocd"];
            
            if (noOfprocd == 1) {
                
               totalamount.Text = string.Format("{0:0.00}", double.Parse(subtotal1.Text));
            }
            else if (noOfprocd == 2)
            {
                totalamount.Text = string.Format("{0:0.00}", (double)(double.Parse(subtotal1.Text) + double.Parse(subtotal2.Text)));
            }else if (noOfprocd == 3)
            {
                totalamount.Text = string.Format("{0:0.00}", (double)(double.Parse(subtotal1.Text) + double.Parse(subtotal2.Text) + double.Parse(subtotal3.Text)));

              
            }
            else if (noOfprocd == 4)
            {
                totalamount.Text = string.Format("{0:0.00}", (double)(double.Parse(subtotal1.Text) + double.Parse(subtotal2.Text) + double.Parse(subtotal3.Text) + double.Parse(subtotal4.Text)));
                
            }
            else if (noOfprocd == 5)
            {
                totalamount.Text = string.Format("{0:0.00}", (double)(double.Parse(subtotal1.Text) + double.Parse(subtotal2.Text) + double.Parse(subtotal3.Text) + double.Parse(subtotal4.Text) + double.Parse(subtotal5.Text) ));
                
            }
           
          
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            createdate();
            Response.Redirect("ordermenupage.aspx");
        }


        public void createdate() {

            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");

            string q1 = string.Format("select cust_id from customer where name = '{0}' allow filtering ", drpcus.SelectedValue);
            var rs_cusname = session.Execute(q1).First();
            int cust_id = rs_cusname.GetValue<int>(0);



            string q_insetorders = string.Format("INSERT INTO orders (order_id, cust_id, add_from, add_to, order_Date, staff_name, total_price, status) VALUES ({0},{1}, '{2}' , '{3}' , '{4}', '{5}' , {6}, 'pending'); ", txtordid.Text, cust_id, txtfrom.Text, txtto.Text, txtdate.Text, txtsaleperson.Text, totalamount.Text);
            session.Execute(q_insetorders);

            int noOfprocd = (int)this.Session["noOfprocd"];
            if (noOfprocd >= 1)
            {
                string q3 = string.Format("select product_id from product where product_name ='{0}' allow filtering ", DropDownList1.SelectedValue);
                var prod_id = session.Execute(q3).First();
                int prod_id1 = (prod_id.GetValue<int>(0));

                string q_insert1 = string.Format("INSERT INTO orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal   ) VALUES ({0},{1}, {2} , {3} , {4}, {5});", txtordid.Text, prod_id1, qty1.Text, price1.Text, dics1.Text, subtotal1.Text);
                session.Execute(q_insert1);
            }
            if (noOfprocd >= 2)
            {
                string q3 = string.Format("select product_id from product where product_name ='{0}' allow filtering ", DropDownList2.SelectedValue);
                var prod_id = session.Execute(q3).First();
                int prod_id1 = (prod_id.GetValue<int>(0));

                string q_insert1 = string.Format("INSERT INTO orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal   ) VALUES ({0},{1}, {2} , {3} , {4}, {5});", txtordid.Text, prod_id1, qty2.Text, price2.Text, dics2.Text, subtotal2.Text);
                session.Execute(q_insert1);
            }
            if (noOfprocd >= 3)
            {
                string q3 = string.Format("select product_id from product where product_name ='{0}' allow filtering ", DropDownList3.SelectedValue);
                var prod_id = session.Execute(q3).First();
                int prod_id1 = (prod_id.GetValue<int>(0));

                string q_insert1 = string.Format("INSERT INTO orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal   ) VALUES ({0},{1}, {2} , {3} , {4}, {5});", txtordid.Text, prod_id1, qty3.Text, price3.Text, dics3.Text, subtotal3.Text);
                session.Execute(q_insert1);
            }
            if (noOfprocd >= 4)
            {
                string q3 = string.Format("select product_id from product where product_name ='{0}' allow filtering ", DropDownList4.SelectedValue);
                var prod_id = session.Execute(q3).First();
                int prod_id1 = (prod_id.GetValue<int>(0));

                string q_insert1 = string.Format("INSERT INTO orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal   ) VALUES ({0},{1}, {2} , {3} , {4}, {5});", txtordid.Text, prod_id1, qty4.Text, price4.Text, dics4.Text, subtotal4.Text);
                session.Execute(q_insert1);
            }
            if (noOfprocd >= 5)
            {
                string q3 = string.Format("select product_id from product where product_name ='{0}' allow filtering ", DropDownList5.SelectedValue);
                var prod_id = session.Execute(q3).First();
                int prod_id1 = (prod_id.GetValue<int>(0));

                string q_insert1 = string.Format("INSERT INTO orders_details  ( order_id, product_id , qty , sell_price , disc, subtotal   ) VALUES ({0},{1}, {2} , {3} , {4}, {5});", txtordid.Text, prod_id1, qty5.Text, price5.Text, dics5.Text, subtotal5.Text);
                session.Execute(q_insert1);
            }


        }

        public void createpdf() {
            Document document = new Document(PageSize.A4, 10, 10, 10, 10);

            string reportname = string.Format("order_detail_0{0}.pdf", txtordid.Text);
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
            AddCellToBody1(tableLayout, txtordid.Text);
            AddCellToBody1(tableLayout, "Customer");
            AddCellToBody1(tableLayout, drpcus.SelectedValue);
            AddCellToBody1(tableLayout, "E-mail Address");
            AddCellToBody1(tableLayout, txtemail.Text);            
            AddCellToBody1(tableLayout, "Salesperson");
            AddCellToBody1(tableLayout, txtsaleperson.Text);
            AddCellToBody1(tableLayout, "Order Date");
            AddCellToBody1(tableLayout, txtdate.Text);
            AddCellToBody1(tableLayout, "From");
            AddCellToBody1(tableLayout, txtfrom.Text);
            AddCellToBody1(tableLayout, "Ship To");
            AddCellToBody1(tableLayout, txtto.Text);
            AddCellToBody1(tableLayout, "Status");
            AddCellToBody1(tableLayout, "pending");

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
            int noOfprocd = (int)this.Session["noOfprocd"];
            if (noOfprocd >= 1) {
                AddCellToBody(tableLayout, DropDownList1.SelectedValue);
                AddCellToBody(tableLayout, qty1.Text);
                AddCellToBody(tableLayout, price1.Text);
                AddCellToBody(tableLayout, dics1.Text);
                AddCellToBody(tableLayout, subtotal1.Text);

                
            }
            if (noOfprocd >= 2)
            {
                AddCellToBody(tableLayout, DropDownList2.SelectedValue);
                AddCellToBody(tableLayout, qty2.Text);
                AddCellToBody(tableLayout, price2.Text);
                AddCellToBody(tableLayout, dics2.Text);
                AddCellToBody(tableLayout, subtotal2.Text);
            }
            if (noOfprocd >= 3)
            {

                AddCellToBody(tableLayout, DropDownList3.SelectedValue);
                AddCellToBody(tableLayout, qty3.Text);
                AddCellToBody(tableLayout, price3.Text);
                AddCellToBody(tableLayout, dics3.Text);
                AddCellToBody(tableLayout, subtotal3.Text);
            }
            if (noOfprocd >= 4)
            {
                AddCellToBody(tableLayout, DropDownList4.SelectedValue);
                AddCellToBody(tableLayout, qty4.Text);
                AddCellToBody(tableLayout, price4.Text);
                AddCellToBody(tableLayout, dics4.Text);
                AddCellToBody(tableLayout, subtotal4.Text);
            }
            if (noOfprocd >= 5)
            {
                AddCellToBody(tableLayout, DropDownList5.SelectedValue);
                AddCellToBody(tableLayout, qty5.Text);
                AddCellToBody(tableLayout, price5.Text);
                AddCellToBody(tableLayout, dics5.Text);
                AddCellToBody(tableLayout, subtotal5.Text);
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
             iTextSharp.text.Font fontTinyItalic = FontFactory.GetFont("Arial", 7,  BaseColor.BLACK);
            tableLayout.AddCell(new PdfPCell(new Phrase(cellText, fontTinyItalic))
            {
                HorizontalAlignment = Element.ALIGN_LEFT,
                Padding = 5,
             
            });
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            createdate();
            createpdf();
            Response.Redirect("ordermenupage.aspx");
        }
    }



}