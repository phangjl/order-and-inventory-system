using Cassandra;
using Cassandra.Data.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication1
{
    public partial class viewInventoryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");


            var productTable = new Table<product>(session);
            List<int> record0 = (from s in productTable select s.product_id).Execute().ToList();
            this.Session["allProductId"] = record0;

            List<string> record1 = (from s in productTable select s.product_name).Execute().ToList();
            this.Session["allProductName"] = record1;

            List<string> record2 = (from s in productTable select s.model).Execute().ToList();
            this.Session["allModel"] = record2;

            List<string> record3 = (from s in productTable select s.category).Execute().ToList();
            this.Session["allCategory"] = record3;

            List<string> record4 = (from s in productTable select s.manufacturer).Execute().ToList();
            this.Session["allManufacturer"] = record4;

            List<string> record5 = (from s in productTable select s.supplier).Execute().ToList();
            this.Session["allSupplier"] = record5;

            List<int> record6 = (from s in productTable select s.quantity).Execute().ToList();
            this.Session["allQuantity"] = record6;

            List<double> record7 = (from s in productTable select s.price).Execute().ToList();
            this.Session["allUnitPrice"] = record7;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("inventoryMenuPage.aspx");
        }

        class product
        {
            public int product_id { get; set; }
            public string product_name { get; set; }

            public string category { get; set; }
            public string location { get; set; }

            public string manufacturer { get; set; }
            public string supplier { get; set; }

            public string model { get; set; }

            public string description { get; set; }
            public string comments { get; set; }
            public int transaction { get; set; }
            public int quantity { get; set; }

            public double price { get; set; }

            public int reorderLevel { get; set; }

            public int targetStockLevel { get; set; }

            public string discontinued { get; set; }
        }


    }




}