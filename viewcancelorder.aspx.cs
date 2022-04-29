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
    public partial class viewcancelorder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");
                // string q = string.Format("select order_id from orders");
                
                var Ordertable = new Table<Orders>(session);
                List<int> record0 = (from s in Ordertable select s.order_id).Execute().ToList();
                this.Session["allid1"] = record0;

                List<LocalDate> record1 = (from s in Ordertable select s.order_date).Execute().ToList();
                this.Session["alldate1"] = record1;

                List<int> record2 = (from s in Ordertable select s.cust_id).Execute().ToList();
                List<string> record22 = new List<string>();

                var costable = new Table<customer>(session);
                List<int> row = (from s in costable select s.cust_id).Execute().ToList();
                List<string> row1 = (from s in costable select s.name).Execute().ToList();
                for (int i = 0; i < record2.Count(); i++)
                {
                    for (int j = 0; j < row.Count(); j++)
                    {
                        if (record2[i] == row[j])
                        {
                            record22.Add(row1[j]);
                        }
                    }

                }

                this.Session["allcust1"] = record22;

                List<string> record4 = (from s in Ordertable select s.staff_name).Execute().ToList();
                this.Session["allstaff1"] = record4;

                List<double> record5 = (from s in Ordertable select s.total_price).Execute().ToList();
                this.Session["allprice1"] = record5;

                List<string> record6 = (from s in Ordertable select s.status).Execute().ToList();
                this.Session["allstatus1"] = record6;
            }


            }


        public class Orders
        {
            public int order_id { get; set; }
            public int cust_id { get; set; }
            public LocalDate order_date { get; set; }
            public string staff_name { get; set; }
            public double total_price { get; set; }
            public string status { get; set; }

        }
        public class customer
        {

            public int cust_id { get; set; }

            public string name { get; set; }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ordermenupage.aspx");
        }
    }
}