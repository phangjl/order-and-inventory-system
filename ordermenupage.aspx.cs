﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ordermenupage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("vieworder.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewcancelorder.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("createorder.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("salesreport.aspx");
        }
    }
}