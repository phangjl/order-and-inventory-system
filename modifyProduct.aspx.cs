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
    public partial class modifyProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");
                int id = Int32.Parse(Request.QueryString["id"]);


                string query = String.Format("select product_id,category,comments ,description,discontinued,location ,manufacturer,model, price,product_name ,quantity ,reorderLevel ,supplier ,targetStockLevel ,transaction from product where product_id = {0}", id);
                RowSet rs = session.Execute(query);

                foreach (var x in rs)
                {
                    txtIdValue.Text = x.GetValue<int>(0).ToString();
                    ddlCategoryValue.SelectedValue = x.GetValue<string>(1);
                    txtCommentsValue.Text = x.GetValue<string>(2);
                    txtDescriptionValue.Text = x.GetValue<string>(3);
                    txtDiscontinuedValue.Text = x.GetValue<string>(4);
                    txtLocationValue.Text = x.GetValue<string>(5);
                    txtManufacturerValue.Text = x.GetValue<string>(6);
                    txtModelValue.Text = x.GetValue<string>(7);
                    txtProductNameValue.Text = x.GetValue<string>(9);
                    txtCurrentStockValue.Text = x.GetValue<int>(10).ToString();
                    txtReorderLevelValue.Text = x.GetValue<int>(11).ToString();
                    txtSupplierValue.Text = x.GetValue<string>(12);
                    txtTargetStockLevelValue.Text = x.GetValue<int>(13).ToString();
                    txtTransactionValue.Text = x.GetValue<int>(14).ToString();


                }
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtProductNameValue.Enabled = true;
            ddlCategoryValue.Enabled = true;
            txtCommentsValue.Enabled = true;
            txtDescriptionValue.Enabled = true;
            txtCurrentStockValue.Enabled = true;
            txtDiscontinuedValue.Enabled = true;
            txtLocationValue.Enabled = true;
            txtManufacturerValue.Enabled = true;
            txtModelValue.Enabled = true;
            txtReorderLevelValue.Enabled = true;
            txtSupplierValue.Enabled = true;
            txtTargetStockLevelValue.Enabled = true;
            txtTransactionValue.Enabled = true;

            btnSave.Visible = true;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            txtProductNameValue.Enabled = false;
            ddlCategoryValue.Enabled = false;
            txtCommentsValue.Enabled = false;
            txtDescriptionValue.Enabled = false;
            txtCurrentStockValue.Enabled = false;
            txtDiscontinuedValue.Enabled = false;
            txtIdValue.Enabled = false;
            txtLocationValue.Enabled = false;
            txtManufacturerValue.Enabled = false;
            txtModelValue.Enabled = false;
            txtReorderLevelValue.Enabled = false;
            txtSupplierValue.Enabled = false;
            txtTargetStockLevelValue.Enabled = false;
            txtTransactionValue.Enabled = false;

            btnSave.Visible = false;

            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");


            string q = string.Format("update product set product_name = '{0}', category = '{1}', location = '{2}', manufacturer = '{3}', supplier = '{4}',model = '{5}', description = '{6}', comments = '{7}', transaction = {8}, quantity = {9},reorderLevel = {10}, targetStockLevel = {11}, discontinued = '{12}' WHERE product_id = {13}", txtProductNameValue.Text, ddlCategoryValue.SelectedValue, txtLocationValue.Text, txtManufacturerValue.Text, txtSupplierValue.Text, txtModelValue.Text, txtDescriptionValue.Text, txtCommentsValue.Text, txtTransactionValue.Text, txtCurrentStockValue.Text, txtReorderLevelValue.Text, txtTargetStockLevelValue.Text, txtDiscontinuedValue.Text, txtIdValue.Text);


            session.Execute(q);

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //string url = "confirmation.aspx";
            //string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            //ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);

            if (MessageBox.Show("Do you really want to delete this product?", "Message", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
                //// Connect to the nodes using a keyspace
                var session = cluster.Connect("ordinv_db");


                string q = string.Format("Delete from product where product_id = {0}", txtIdValue.Text);
                session.Execute(q);
                Response.Redirect("viewInventoryReport.aspx");
            }
            else
            {

            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewInventoryReport.aspx");
        }
    }
}