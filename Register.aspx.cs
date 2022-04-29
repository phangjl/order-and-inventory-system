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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Confirm_Click(object sender, EventArgs e)
        {
            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");
            string query = "select max(username) from staff";
            RowSet rs = session.Execute(query);
            //int userID = rs.GetRows().First().GetValue<int>(0) + 1;

            string q = string.Format("insert into staff (username,name,password,email,position) VALUES ('{0}','{1}','{2}','{3}','{4}');", txtUserNameValue.Text, txtNameValue.Text, txtPasswordValue.Text, txtEmailValue.Text, ddlpositionValue.SelectedValue);
            session.Execute(q);
            Response.Redirect("staffmenu.aspx");
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {

            Response.Redirect("staffmenu.aspx");
        }
    }
}