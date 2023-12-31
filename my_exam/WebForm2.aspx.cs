using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace my_exam
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Populate();
            }
        }
        private void Populate()
        {
            string constr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection _cn = new SqlConnection(constr))
            {
                using (SqlCommand _cmd = new SqlCommand("SELECT * FROM QuestionTable", _cn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(_cmd))
                    {

                        _cn.Open();
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dlQuestion.DataSource = ds;
                        dlQuestion.DataBind();
                        this.rptAnswer.DataSource = ds;
                        this.rptAnswer.DataBind();
                        _cn.Close();
                    }
                }
            }
        }

    }
}
