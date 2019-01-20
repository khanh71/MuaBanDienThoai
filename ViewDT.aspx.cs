using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            tendt();
            tongquat();
            thongso();
            danhgia();
            Hinh();
            Title();
            khuyenmai();
        }
    }
    private void tendt()
    {
        DataTable dt = XLDL.LayDuLieu("select tensp from dienthoai where masp='" + Request.QueryString["MaSP"] + "'");
        if (dt.Rows.Count > 0)
        {
            TenDT.Text = dt.Rows[0][0].ToString();
        }
        else
            Response.Redirect("~/dienthoai.aspx");
    }
    private void Title()
    {
        DataTable dt = XLDL.LayDuLieu("select TenSP from DIENTHOAI where MaSP='" + Request.QueryString["MaSP"] + "'");
        lbTitle.Controls.Add(new LiteralControl(dt.Rows[0][0].ToString()));
    }
    private void thongso()
    {
        dlThongSo.DataSource = XLDL.LayDuLieu("select * from thongso,thongsochitiet where thongso.masp=thongsochitiet.masp and thongso.masp='" + Request.QueryString["MaSP"] + "'");
        dlThongSo.DataBind();
    }
    private void tongquat()
    {
        dlTongQuat.DataSource = XLDL.LayDuLieu("select * from dienthoai,congty,kho where congty.macty=dienthoai.macty and dienthoai.masp=kho.masp and dienthoai.masp='" + Request.QueryString["MaSP"] + "'");
        dlTongQuat.DataBind();
    }
    private void danhgia()
    {
        lbDanhGia.Text = XLDL.LayDuLieu("select danhgia from danhgia where masp='" + Request.QueryString["MaSP"] + "'").Rows[0][0].ToString();
    }
    private void Hinh()
    {
        dlHinh.DataSource = XLDL.LayDuLieu("select tencty,bannersp.masp,hinh from bannersp,dienthoai,congty where bannersp.masp=dienthoai.masp and dienthoai.macty=congty.macty and bannersp.masp='" + Request.QueryString["MaSP"] + "'");
        dlHinh.DataBind();
    }
    private void khuyenmai()
    {
        dlKhuyenMai.DataSource = XLDL.LayDuLieu("select noidung from khuyenmaisp where masp='" + Request.QueryString["MaSP"] + "'");
        dlKhuyenMai.DataBind();
    }
    protected void dlTongQuat_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbTraGop = (Label)e.Item.FindControl("lbTraGop");
        Label lbGiamGia = (Label)e.Item.FindControl("lbGiamGia");
        if (lbTraGop.Text == "True")
            lbTraGop.Text = "Có";
        else
            lbTraGop.Text = "Không";
        if (lbGiamGia.Text == "₫")
            lbGiamGia.Text = "Không";
    }

    protected void linkedit_Load(object sender, EventArgs e)
    {
        linkedit.NavigateUrl = "~/SuaDT.aspx?Masp=" + Request.QueryString["MaSP"];
    }
}