using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Cassandra;
using Cassandra.Data.Linq;
using System.Web.Services.Description;

namespace WebApplication1
{
    public partial class modifyStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");
                var id = Request.QueryString["id"];


                string query = String.Format("select username, name, password, email, position from staff where username = '{0}'", id);
                RowSet rs1 = session.Execute(query);

                foreach (var y in rs1)
                {
                    txtusernameValue.Text = y.GetValue<string>(0).ToString();
                    txtnameValue.Text = y.GetValue<string>(1);
                    txtpasswordValue.Text = y.GetValue<string>(2);
                    txtemailValue.Text = y.GetValue<string>(3);
                    ddlpositionValue.SelectedValue = y.GetValue<string>(4);

                }
            }

        }

        protected void btnsEdit_Click(object sender, EventArgs e)
        {
            //txtusernameValue.Enabled = true;
            txtnameValue.Enabled = true;
            txtpasswordValue.Enabled = true;
            txtemailValue.Enabled = true;
            ddlpositionValue.Enabled = true;

            btnsSave.Visible = true;

        }

        protected void btnsSave_Click(object sender, EventArgs e)
        {
            txtusernameValue.Enabled = false;
            txtnameValue.Enabled = false;
            txtpasswordValue.Enabled = false;
            txtemailValue.Enabled = false;
            ddlpositionValue.Enabled = false;

            btnsSave.Visible = false;

            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");


            string q = string.Format("update staff set name = '{0}', password = '{1}', email = '{2}', position = '{3}' WHERE username = '{4}'", txtnameValue.Text, txtpasswordValue.Text, txtemailValue.Text, ddlpositionValue.SelectedValue, txtusernameValue.Text);


            session.Execute(q);

        }


        protected void btnsDelete_Click(object sender, EventArgs e)
        {
            //string url = "confirmation.aspx";
            //string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            //ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);

            if (MessageBox.Show("Do you really want to delete this staff?", "Message", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");


                string q = string.Format("Delete from staff where username = '{0}'", txtusernameValue.Text);
                session.Execute(q);
                Response.Redirect("staffmenu.aspx");
            }
            else
            {

            }

        }

        protected void btnsBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("staffmenu.aspx");
        }
    }
}