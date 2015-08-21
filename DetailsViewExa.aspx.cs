using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListViewExa : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            BindDetailsView();
        }
    }

    private void BindDetailsView()
    {
        conn.Open();
        cmd = new SqlCommand("select * from person", conn);
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        DetailsView1.DataSource = dt;
        DetailsView1.DataBind();
        conn.Close();
    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        DetailsView1.PageIndex = e.NewPageIndex;
        BindDetailsView();
    }
    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        switch (e.CommandName.ToString())
        {
            case "Edit":
                DetailsView1.ChangeMode(DetailsViewMode.Edit);
                BindDetailsView();
                break;
            case "New":
                DetailsView1.ChangeMode(DetailsViewMode.Insert);
                BindDetailsView();
                break;
            case "Cancel":
                DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                BindDetailsView();
                break;
  }
    }
    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }
    
   
    protected void lbinsert_Click(object sender, EventArgs e)
    {
        conn.Open();
        cmd = new SqlCommand("insert into person values(@fname,@lname,@city)", conn);
        cmd.Parameters.AddWithValue("@fname", ((TextBox)DetailsView1.Rows[0].FindControl("TextBox2")).Text);
        cmd.Parameters.AddWithValue("@lname", ((TextBox)DetailsView1.Rows[1].FindControl("TextBox4")).Text);
        cmd.Parameters.AddWithValue("@city", ((TextBox)DetailsView1.Rows[2].FindControl("TextBox6")).Text);
        cmd.ExecuteNonQuery();
        conn.Close();
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetailsView();
    }
    protected void lbdelete_Click(object sender, EventArgs e)
    {
        conn.Open();
        cmd = new SqlCommand("delete from person where pid=@pid", conn);
        cmd.Parameters.AddWithValue("@pid", DetailsView1.DataKey["pid"].ToString());
        cmd.ExecuteNonQuery();
        conn.Close();
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetailsView();
    }
    protected void lbupdate_Click(object sender, EventArgs e)
    {
        conn.Open();
        cmd = new SqlCommand("update person set fname=@fname,lname=@lname,city=@city where pid=@pid", conn);
        cmd.Parameters.AddWithValue("@pid", DetailsView1.DataKey["pid"].ToString());
        cmd.Parameters.AddWithValue("@fname", ((TextBox)DetailsView1.Rows[0].FindControl("TextBox1")).Text);
        cmd.Parameters.AddWithValue("@lname", ((TextBox)DetailsView1.Rows[1].FindControl("TextBox3")).Text);
        cmd.Parameters.AddWithValue("@city", ((TextBox)DetailsView1.Rows[2].FindControl("TextBox5")).Text);
        cmd.ExecuteNonQuery();
        conn.Close();
        DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetailsView();
    }
}