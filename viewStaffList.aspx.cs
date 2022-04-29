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
    public partial class viewStaffList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");

            //string q = string.Format("select position from staff where username = '{0}' ", this.Session["username"]);
            //var result = session.Execute(q).First();

            var staffTable = new Table<staff>(session);
            List<string> record0 = (from s in staffTable select s.username).Execute().ToList();
            this.Session["allStaffUsername"] = record0;

            List<string> record1 = (from s in staffTable select s.name).Execute().ToList();
            this.Session["allStaffName"] = record1;

            List<string> record2 = (from s in staffTable select s.email).Execute().ToList();
            this.Session["allStaffEmail"] = record2;

            List<string> record3 = (from s in staffTable select s.position).Execute().ToList();
            this.Session["allStaffPosition"] = record3;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("staffmenu.aspx");
        }

        class staff
        {
            public string username { get; set; }
            public string name { get; set; }

            public string email { get; set; }
            public string position { get; set; }
        }
    }
}