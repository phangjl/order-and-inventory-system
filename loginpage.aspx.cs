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
    public partial class loginpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["account"];
                if (cookie != null)
                {
                    txtuser.Text = (string)cookie["username"];

                }
            }
        }

        protected void txtLgIn_Click(object sender, EventArgs e)
        {
            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");

            //string query = "select * from staff where username=" + (string)txtuser.Text;
            string q= string.Format("select * from staff where username = '{0}' and password ='{1}' ALLOW FILTERING", txtuser.Text, TxtPsw.Text); 

            //string query = "select * from staff where username = 'S001' and password = 'S00002' ALLOW FILTERING ";
            int chk = session.Execute(q).Count();
            
            if (chk ==1)
            {
                HttpCookie cookie = new HttpCookie("account");
                if (Remember.Checked)
                {

                    cookie["username"] = txtuser.Text;

                    Response.Cookies.Add(cookie);

                }
                else
                {
                    cookie["username"] = null;
                    Response.Cookies.Add(cookie);

                }
                cookie.Expires = DateTime.Now.AddYears(1);
                string q_takerule = string.Format("select name, position from staff where username = '{0}' ", txtuser.Text);
                var rs = session.Execute(q_takerule).First();

                this.Session["username"] = txtuser.Text;
                this.Session["name"] = rs.GetValue<string>(0) ;
                this.Session["usertype"] = rs.GetValue<string>(1);
                
                Response.Redirect("Menu.aspx");
            }
            else
            {
                ErrorMsg.Text = "The username or password is incorrect ";
            }


            //var Stafftable = new Table<Staff>(session);
            //if ((from s in Stafftable where s.username == txtuser.Text && s.password== TxtPsw.Text select s).Execute().Count() > 0)
            //{

            //    ErrorMsg.Text = "have record";
            //}
            //else {
            //    ErrorMsg.Text = "No record";
            //}

            //Staff staff = (from s in Stafftable where s.username == txtuser.Text select s).Execute().First();
            //if (staff != null) {
            //    if (staff.password == TxtPsw.Text)
            //    {
            //        // go to the first menu page
            //        Response.Redirect("Menu.aspx");
            //    }
            //    else
            //    {

            //        ErrorMsg.Text = "The username or password is incorrect" + staff.password;
            //    }
            //}
            //else{
               
            //    ErrorMsg.Text = "The username or password is incorrect 1";
            //} 


            
           
        }

       
    }
}