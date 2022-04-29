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
    public partial class uploadProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            var cluster = Cluster.Builder().AddContactPoints("127.0.0.1").Build();
            //// Connect to the nodes using a keyspace
            var session = cluster.Connect("ordinv_db");
            string query = "select max(product_id) from product";
            RowSet rs = session.Execute(query);
            int productId = rs.GetRows().First().GetValue<int>(0) + 1;



            string q = string.Format("insert into product (product_id,product_name,category,location,manufacturer,supplier,model,description,comments,transaction,quantity,price,reorderLevel,targetStockLevel,discontinued) values ({0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}',{9},{10},{11},{12},{13},'{14}')", productId, txtProductNameValue.Text, ddlCategoryValue.SelectedValue, txtLocationValue.Text, txtManufacturerValue.Text, txtSupplierValue.Text, txtModelValue.Text, txtDescriptionValue.Text, txtCommentsValue.Text, txtTransactionValue.Text, txtQuantityValue.Text, txtUnitPrice.Text, txtReorderLevelValue.Text, txtTargetStockLevelValue.Text, txtDiscountinuedValue.Text);
            //string q = string.Format("insert into product (product_id,product_name,category,location,manufacturer,supplier,model,description,comments,transaction,quantity,price,reorderLevel,targetStockLevel,discontinued) values (3,'Walking On Air',  'SHOES',  'No. 12A, Jalan Suria Puchong 1, Perniagaan Suria Puchong Gateway,Puchong,Selangor', 'Puma','Jackson Lee','KKB-090','This product is designed by a famous designer, Aaron Lee','Stock located at the main location',980,900,450.00,250,1000,'Not discontinued')");


            session.Execute(q);
            Response.Redirect("viewInventoryReport.aspx");

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("inventoryMenuPage.aspx");
        }
    }
}