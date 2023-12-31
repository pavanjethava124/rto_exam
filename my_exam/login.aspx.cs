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
    public partial class login : System.Web.UI.Page
    {
        HttpCookie a;
        protected void Page_Load(object sender, EventArgs e)
        {

         }

        protected void Button1_Click(object sender, EventArgs e)
        {
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\dell\source\repos\my_exam\my_exam\App_Data\Database1.mdf;Integrated Security=True");
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from login where username='" + TextBox1.Text + "'and pass='" + TextBox2.Text + "'", con);
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                cmd.Parameters.AddWithValue("username", TextBox1.Text);
                cmd.Parameters.AddWithValue("pass", TextBox2.Text);

                if (dr.HasRows == true)
                    while (dr.Read())
                    {
                    Response.Redirect("testselection.aspx");
                    }
                else
                {
                    Response.Write("please enter valid username and password");
                }
                con.Close();

            }
        }
}