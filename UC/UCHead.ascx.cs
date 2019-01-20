using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UC_UCHead : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TenDN"] != null)
        {
            DangNhap.Visible = false;
            lbTenDN.Visible = true;
            lbTenDN.Text = Session["TenDN"].ToString() + " |";
            DangXuat.Visible = true;
        }
        else
        {
            lbTenDN.Text = "";
            lbTenDN.Visible = false;
            DangXuat.Visible = false;
            DangNhap.Visible = true;
        }
        if (Session["Giohang"] != null)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["Giohang"];
            System.Int32 tongSl = 0;
            tongSl += dt.Rows.Count;
            hpGiohang.Text = tongSl.ToString();
        }
    }
    protected void DangXuat_Click(object sender, EventArgs e)
    {
        Session["TenDN"] = null;
        Session["Giohang"] = null;
        Response.Redirect("~/index.aspx");
    }
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (txtTimKiem.Text.Trim() != "")
        {
            XLDL.Timkiem = txtTimKiem.Text.Trim();
            Response.Redirect("~/TimKiem.aspx");
        }
        else
            Response.Redirect("~/index.aspx");
    }
}