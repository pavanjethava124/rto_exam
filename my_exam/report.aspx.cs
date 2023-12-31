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
    public partial class report : System.Web.UI.Page
    {
        HttpCookie ad;
        public SqlConnection con;
        public SqlCommand cmd;
        public SqlDataReader dr;
        string qry;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\dell\source\repos\my_exam\my_exam\App_Data\Database1.mdf;Integrated Security=True");
            con.Open();

            qry = "select * from result";
            cmd = new SqlCommand(qry, con);
            dr = cmd.ExecuteReader();
        }
    }
}