using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cassandra;
using Cassandra.Data.Linq;


namespace WebApplication1
{
    public partial class salesreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (this.Session["selectyear"] == null)
                {
                    this.Session["selectyear"] = Button3.Text;
                    Button3.BackColor = System.Drawing.Color.White;
                    Button3.ForeColor = System.Drawing.Color.Black;
                    Button5.BackColor = System.Drawing.Color.Black;
                    Button5.ForeColor = System.Drawing.Color.White;
                    Button2.BackColor = System.Drawing.Color.Black;
                    Button2.ForeColor = System.Drawing.Color.White;
                }
                fillform();
            }
                
           
            
        }
        public void fillform() {


            string year = (string)this.Session["selectyear"];
            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");
            string q = string.Format("select * from orders where order_Date >= '{0}-01-01' and order_date <= '{1}-12-31' allow filtering;", year, year);
            int noOforder = session.Execute(q).Count();
            string q1 = string.Format("select * from orders where order_Date >= '{0}-01-01' and order_date <= '{1}-12-31' and status = 'delivered' allow filtering;", year, year);
            int noOfdelivered = session.Execute(q1).Count();

            string q2 = string.Format("select * from orders where order_Date >= '{0}-01-01' and order_date <= '{1}-12-31' and status = 'pending' allow filtering;", year, year);
            int noOfpending = session.Execute(q2).Count();

            string q3 = string.Format("select * from orders where order_Date >= '{0}-01-01' and order_date <= '{1}-12-31' and status = 'canceled' allow filtering;", year, year);
            int noOfcancel = session.Execute(q3).Count();

            string q4 = string.Format("select sum(total_price) from orders where order_Date >= '{0}-01-01' and order_date <= '{1}-12-31' and status = 'delivered' allow filtering;", year, year);
            double totalamount1 = session.Execute(q4).First().GetValue<double>(0);
            string q5 = string.Format("select sum(total_price) from orders where order_Date >= '{0}-01-01' and order_date <= '{1}-12-31' and status = 'pending' allow filtering;", year, year);
            double totalamount2 = session.Execute(q5).First().GetValue<double>(0);
            double total = totalamount1 + totalamount2;

            Label01.Text = DateTime.Now.ToString("yyyy-MM-dd");
            Label02.Text = string.Format("{0}-01-01 -> {1}-12-31", year, year);
            Label03.Text = noOforder.ToString();
            Label04.Text = noOfdelivered.ToString();
            Label05.Text = noOfpending.ToString();
            Label06.Text = noOfcancel.ToString();
            Label07.Text = string.Format("{0:0.00}", total);



        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ordermenupage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            this.Session["selectyear"] = Button2.Text;
            Button2.BackColor = System.Drawing.Color.White;
            Button2.ForeColor = System.Drawing.Color.Black;
            Button5.BackColor = System.Drawing.Color.Black;
            Button5.ForeColor = System.Drawing.Color.White;
            Button3.BackColor = System.Drawing.Color.Black;
            Button3.ForeColor = System.Drawing.Color.White;
            fillform();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            this.Session["selectyear"] = Button5.Text;
            Button5.BackColor = System.Drawing.Color.White;
            Button5.ForeColor = System.Drawing.Color.Black;
            Button2.BackColor = System.Drawing.Color.Black;
            Button2.ForeColor = System.Drawing.Color.White;
            Button3.BackColor = System.Drawing.Color.Black;
            Button3.ForeColor = System.Drawing.Color.White;
            fillform();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.Session["selectyear"] = Button3.Text;
            Button3.BackColor = System.Drawing.Color.White;
            Button3.ForeColor = System.Drawing.Color.Black;
            Button5.BackColor = System.Drawing.Color.Black;
            Button5.ForeColor = System.Drawing.Color.White;
            Button2.BackColor = System.Drawing.Color.Black;
            Button2.ForeColor = System.Drawing.Color.White;
            fillform();
        }

    }
}