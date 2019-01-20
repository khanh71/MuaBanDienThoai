using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuaAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            suaad();
        }
    }
    private void suaad()
    {
        dlSuaAdmin.DataSource = XLDL.LayDuLieu("select * from admin where id = " + Request.QueryString["id"]);
        dlSuaAdmin.DataBind();
    }

    protected void dlSuaAdmin_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(dlSuaAdmin.DataKeys[e.Item.ItemIndex].ToString());
        TextBox txtHoTen = (TextBox)e.Item.FindControl("txtHoTen");
        TextBox txtDiaChi = (TextBox)e.Item.FindControl("txtDiaChi");
        TextBox txtSDT = (TextBox)e.Item.FindControl("txtSDT");
        TextBox txtEmail = (TextBox)e.Item.FindControl("txtEmail");
        try
        {
            XLDL.Chaylenh("update admin set hoten=N'" + txtHoTen.Text.Trim() + "',diachi=N'" + txtDiaChi.Text.Trim() + "',sdt='" + txtSDT.Text.Trim() + "',email=N'" + txtEmail.Text.Trim() + "' where id=" + id);
            Response.Redirect("~/quantrivien.aspx");
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Vui lòng thử lại sau')</script>");
        }
    }
}