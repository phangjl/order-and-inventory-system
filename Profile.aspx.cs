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
    public partial class Profile : System.Web.UI.Page
    {
        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }
        protected void EditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyStaffProfile.aspx");
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");
            string q= string.Format("select username,email,name, position from staff where username = '{0}' ", this.Session["username"]);
            var result = session.Execute(q).First();

            userName.Text = (result.GetValue<string>(0)).ToString();
            email.Text = (result.GetValue<string>(1)).ToString();
            name.Text = (result.GetValue<string>(2)).ToString();
            position.Text= (result.GetValue<string>(3)).ToString();


        }
        public class Staff
        {
            public string username { get; set; }
            public string email { get; set; }
            public string name { get; set; }
            public string password { get; set; }
            public string position { get; set; }

        }


    }
}