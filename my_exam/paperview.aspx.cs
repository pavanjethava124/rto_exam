using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace my_exam
{
    public partial class paperview : System.Web.UI.Page
    {
        public SqlConnection con;
        public SqlCommand cmd;
        public SqlDataReader dr;
        public string qry;

        string settype;
        public int ans;
        HttpCookie ad;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\dell\source\repos\my_exam\my_exam\App_Data\Database1.mdf;Integrated Security=True");
            con.Open();
            settype = System.Convert.ToString(Request.QueryString["settype"]);
            HiddenField1.Value = testlist.SelectedValue;
            qry = "select * from question where settype='" + HiddenField1.Value + "' order by qid";
            cmd = new SqlCommand(qry, con);
            dr = cmd.ExecuteReader();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }

        protected void testlist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}