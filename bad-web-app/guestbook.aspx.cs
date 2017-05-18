using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bad_web_app
{
    public partial class guestbook : System.Web.UI.Page
    {
        //public guestbook() { }
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["GuestbookDb"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCommentsFromDB();
        }

        public void GetCommentsFromDB()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Comment FROM Comments", con);
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    var myString = rdr.GetString(0) + "<br />";
                    Response.Write(myString);
                }
            }
            con.Close();
        }

        public void AddToDB(string strComment)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Comments (Comment) VALUES ('" + strComment + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void SearchFromComments(string text)
        {
            con.Open();
            var query = "SELECT Comment FROM Comments WHERE Comment LIKE '%" + text + "%'";
            SqlCommand cmd = new SqlCommand(query, con);
            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                while (rdr.Read())
                {
                    var myString = rdr.GetString(0) + "<br />";
                    Response.Write(myString);
                }
            }
            con.Close();
        }
    }
}