using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from person", con);
        SqlDataReader dr = cmd.ExecuteReader();
        GridView1.DataSource = dr;
        GridView1.DataBind();
        con.Close();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into person values(@fname,@lname,@city)", con);
        cmd.Parameters.AddWithValue("@fname", txtfn.Text.Trim());
        cmd.Parameters.AddWithValue("@lname", txtln.Text.Trim());
        cmd.Parameters.AddWithValue("@city", txtcity.Text.Trim());
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
        BlankTB();
    }

    private void BlankTB()
    {
        txtfn.Text = string.Empty;
        txtln.Text = string.Empty;
        txtcity.Text = string.Empty;
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update person set fname=@fname,lname=@lname, city=@city where pid=@pid", con);
        int value = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
        cmd.Parameters.AddWithValue("@pid", value);

        string fn = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
        cmd.Parameters.AddWithValue("@fname", fn);

        string ln = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
        cmd.Parameters.AddWithValue("@lname", ln);

        string city = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3")).Text;
        cmd.Parameters.AddWithValue("@city", city);

        cmd.ExecuteNonQuery();
        con.Close();

        GridView1.EditIndex = -1;
        BindGrid();        
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from person where pid=@pid", con);
        int value = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
        cmd.Parameters.AddWithValue("@pid", value);
        cmd.ExecuteNonQuery();
        con.Close();
        BindGrid();
    }  


    protected void CheckBox2_CheckedChanged1(object sender, EventArgs e)
    {
        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
        if (chkall.Checked)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                chk.Checked = true;
                chk.Enabled = false;
            }
        }
        else
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                chk.Checked = false;
                chk.Enabled = true;
            }
        }
        
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       if (e.CommandName == "DeleteAll")
       {
           CheckBox chkAll = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
           if (chkAll.Checked)
           {
               con.Open();
               SqlCommand cmd = new SqlCommand("delete from person", con);
               cmd.ExecuteNonQuery();
               con.Close();
               BindGrid();
           }
           else
           {
               for (int i = 0; i < GridView1.Rows.Count; i++)
               {
                   CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                   if (chk.Checked)
                   {
                       con.Open();
                       SqlCommand cmd = new SqlCommand("delete from person where pid=@pid", con);
                       int value = Convert.ToInt16(GridView1.DataKeys[i].Value);
                       cmd.Parameters.AddWithValue("@pid", value);
                       cmd.ExecuteNonQuery();
                       con.Close();
                       BindGrid();                    
                   }
               }
           }
           BindGrid();
       }
    }    
}