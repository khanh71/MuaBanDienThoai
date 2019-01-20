using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class SuaCT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Title();
            motaCty();
            TenCT.Text = XLDL.LayDuLieu("select tencty from congty where macty='" + Request.QueryString["MaCty"] + "'").Rows[0][0].ToString();
        }
    }
    private void Title()
    {
        DataTable dt = XLDL.LayDuLieu("select TenCty from congty where MaCty=" + Request.QueryString["MaCty"]);
        if (dt.Rows.Count > 0)
            lbTitle.Controls.Add(new LiteralControl(dt.Rows[0][0].ToString() + " - Cập Nhật Thông Tin"));
        else
            Response.Redirect("~/congty.aspx");
    }
    private void motaCty()
    {
        dtMota.DataSource = XLDL.LayDuLieu("select * from CONGTY where macty="+Request.QueryString["MaCty"]);
        dtMota.DataBind();
    }

    protected void dtMota_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        TextBox txtTen = (TextBox)e.Item.FindControl("txtTen");
        TextBox txtQuocGia = (TextBox)e.Item.FindControl("txtQuocGia");
        TextBox txtMota = (TextBox)e.Item.FindControl("txtMota");
        string oldurl = "", newurl = "";
        DataTable dt = XLDL.LayDuLieu("select tencty from congty where macty=" + int.Parse(Request.QueryString["macty"].ToString()));
        if (dt.Rows.Count > 0)
            oldurl = "~/images/" + dt.Rows[0][0];
        try
        {
            XLDL.Chaylenh("update congty set tencty=N'" + txtTen.Text.Trim() + "',quocgia=N'" + txtQuocGia.Text.Trim() + "',mota=N'" + txtMota.Text.Trim() + "' where macty = " + Request.QueryString["macty"]);
            newurl = "~/images/" + txtTen.Text.Trim();
            if (Directory.Exists(Server.MapPath(oldurl)) && txtTen.Text.Trim()!=dt.Rows[0][0].ToString())
                Directory.Move(Server.MapPath(oldurl), Server.MapPath(newurl));
            Response.Redirect("~/congty.aspx");
        }
        catch
        {
            Response.Write("<script>alert('Lỗi trong quá trình ghi dữ liệu, vui lòng thử lại sau')</script>");
        }
    }
}