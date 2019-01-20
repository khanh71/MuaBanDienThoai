using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class HangSanXuat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            motaCty();
            Deal();
            SanPham();
            Title();
        }

    }
    private void Title()
    {
        DataTable dt = XLDL.LayDuLieu("select TenCty from CONGTY where MaCty=" + Request.QueryString["MaCty"]);
        lbTitle.Controls.Add(new LiteralControl(dt.Rows[0][0].ToString()));
    }
    private void motaCty()
    {
        dtMota.DataSource = XLDL.LayDuLieu("select * from CONGTY where MaCty="+Request.QueryString["MaCty"]);
        dtMota.DataBind();
    }
    private void Deal()
    {
        dtDeal.DataSource = XLDL.LayDuLieu("select top 2 KHUYENMAICTY.HinhAnh,TenCty from CONGTY,KHUYENMAICTY where CONGTY.MaCty=KHUYENMAICTY.MaCty and KHUYENMAICTY.MaCty=" + Request.QueryString["MaCty"]+" and hien=1 order by madeal desc");
        dtDeal.DataBind();
    }
    private void SanPham()
    {
        dlSanPham.DataSource = XLDL.LayDuLieu("select * from THONGSO right join DIENTHOAI on THONGSO.MaSP=DIENTHOAI.MaSP where MaCty=" + Request.QueryString["MaCty"] +" order by DIENTHOAI.MaSP desc");
        dlSanPham.DataBind();
    }

    protected void dlSanPham_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbTraGop = (Label)e.Item.FindControl("lbTraGop1");
        Label lbGiamGia = (Label)e.Item.FindControl("lbGiamGia");
        string tragop = lbTraGop.Text.Trim();
        string giamgia = lbGiamGia.Text.Trim();
        if (tragop != "False" && giamgia != "Giảm ₫")
        {
            lbTraGop.Visible = false;
            lbGiamGia.Visible = true;
        }
        else if (tragop != "False" && giamgia == "Giảm ₫")
        {
            lbTraGop.Visible = true;
            lbTraGop.Text = "Trả Góp 0%";
            lbGiamGia.Visible = false;
        }
        else if (tragop == "False" && giamgia != "Giảm ₫")
        {
            lbTraGop.Visible = false;
            lbGiamGia.Visible = true;
        }
        else
        {
            lbTraGop.Visible = false;
            lbGiamGia.Visible = false;
        }

        Label lbGiaban = (Label)e.Item.FindControl("lbGiaBan1");
        if (lbGiaban.Text.Trim() != "")
        {
            double gia = Convert.ToDouble(lbGiaban.Text.Trim());
            lbGiaban.Text = String.Format("{0:#,#₫}", gia);
        }
        else
        {
            lbGiaban.Text = "Mới ra mắt";
        }
    }
}