using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace my_exam
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        HttpCookie ad;
        SqlConnection con;
        SqlCommand cmd;

        SqlCommand rcmd;
        SqlDataReader rdr;

        SqlCommand qcmd;
        SqlDataReader qdr;

        string qry;
        string nqry;
        string test;

        int qid;
        int ans;
        int flag = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\dell\source\repos\my_exam\my_exam\App_Data\Database1.mdf;Integrated Security=True");
            msg7.Text = Request.QueryString["msg"];
        }
        
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            msg1.Text = "";
            msg2.Text = "";
            msg3.Text = "";
            msg4.Text = "";
            msg5.Text = "";
            msg6.Text = "";
            msg7.Text = "";

            if (RadioButton1.Checked)
                ans = 1;

            if (RadioButton2.Checked)
                ans = 2;

            if (RadioButton3.Checked)
                ans = 3;

            if (RadioButton4.Checked)
                ans = 4;

            if(testlist.Visible)
            {
                test = testlist.Text;
            }
            else
            {
                if(testname.Text=="")
                {
                    msg1.Text = "Enter the test name";
                    flag = 0;
                }
                else
                {
                    con.Open();
                    nqry = "select * from question where settype='" + testname.Text + "'";
                    rcmd = new SqlCommand(nqry, con);
                    rdr = rcmd.ExecuteReader();

                    if(rdr.HasRows)
                    {
                        msg1.Text = "Test name already exist";
                        flag = 0;
                    }
                    test = testname.Text;
                    con.Close();

                }
            }

            if(question.Text==""|| question.Text=="")
            {
                msg2.Text = "Enter the question";
                flag = 0;
            }

            if(opt1.Text==""||opt1.Text=="")
            {
                msg3.Text = "Enter opt1";
                flag = 0;
            }
            if (opt2.Text == "" || opt2.Text == "")
            {
                msg4.Text = "Enter opt2";
                flag = 0;
            }
            if (opt3.Text == "" || opt3.Text == "")
            {
                msg5.Text = "Enter opt3";
                flag = 0;
            }
            if (opt4.Text == "" || opt4.Text == "")
            {
                msg6.Text = "Enter opt4";
                flag = 0;
            }

            if(flag !=0)
            {
                con.Open();
                qcmd = new SqlCommand("select MAX(qid) from question", con);
                qdr = qcmd.ExecuteReader();
                qdr.Read();

                if(qdr.IsDBNull(0))
                {
                    qid = 1;
                }
                else
                {
                    qid = Convert.ToInt16(qdr.GetValue(0)) + 1;
                }
                con.Close();

                con.Open();
                qry = "insert into question values(" + qid + ",'" + question.Text + "','" + test + "','" + opt1.Text + "','" + opt2.Text + "','" + opt3.Text + "','" + opt4.Text + "',"+ans+")";
                cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
                con.Close();
                msg7.Text = "Question submit";
                Response.Redirect("WebForm1.aspx?msg='"+msg7.Text+"'");
            }
        }

        protected void paperview_Click(object sender, EventArgs e)
        {

        }

        protected void testlist_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ntest_Click(object sender, EventArgs e)
        {
            if(testlist.Visible)
            {
                testname.Visible = true;
                testlist.Visible = false;
                ntest.Text = "Old test";
            }
            else
            {
                testname.Visible = false;
                testlist.Visible = true;
                ntest.Text = "new test";

            }
        }
    }
}