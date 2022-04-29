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
    public partial class ModifyStaffProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session1 = cluster.Connect("ordinv_db");
                string query = String.Format("select username, name, password, email from staff where username = '{0}'", this.Session["username"]);
                //var result = session.Execute(query).First();



                RowSet rs = session1.Execute(query);

                foreach (var y in rs)
                {
                    txtusernameValue.Text = y.GetValue<string>(0).ToString();
                    txtnameValue.Text = y.GetValue<string>(1);
                    txtpasswordValue.Text = y.GetValue<string>(2);
                    txtemailValue.Text = y.GetValue<string>(3);
                }
            }
        }
        protected void btnsSave_Click(object sender, EventArgs e)
        {
            //txtusernameValue.Enabled = false;
            txtnameValue.Enabled = false;
            txtpasswordValue.Enabled = false;
            txtemailValue.Enabled = false;

            btnsSave.Visible = false;

            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");


            string q1 = string.Format("update staff set name = '{0}', password = '{1}', email = '{2}' WHERE username = '{3}'", txtnameValue.Text, txtpasswordValue.Text, txtemailValue.Text, txtusernameValue.Text);


            session.Execute(q1);

            Response.Redirect("Profile.aspx");

        }
        protected void btnsBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}