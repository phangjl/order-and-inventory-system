using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cassandra;
using Cassandra.Data.Linq;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class staffmenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] != null && this.Session["usertype"].Equals("Staff"))
            {
                Button2.Enabled = false;
                Button3.Enabled = false;
                string message = " Warning!!! You are not the Manager. Cannot Register new staff or View staff list!";
                lblPositionStatus.Visible = true;
                lblPositionStatus.Text = message;

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("viewStaffList.aspx");
            
        }

    }
}