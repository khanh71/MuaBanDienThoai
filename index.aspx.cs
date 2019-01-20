using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            CreateBanner();
            Sale();
            Hangsx();
        }
    }
    private void Hangsx()
    {
        dlHang.DataSource = XLDL.LayDuLieu("select macty,tencty from congty");
        dlHang.DataBind();
    }
    private void CreateBanner()
    {
        DataTable dt = XLDL.LayDuLieu("select hinh from BANNERHOME where Hien=1");
        int iCount = 0;
        int i = 0;
        if(dt.Rows.Count>0)
        {
            iCount = dt.Rows.Count;
            lbBanner.Controls.Add(new LiteralControl("<div id=\"demo\" class=\"carousel slide\" data-ride=\"carousel\">"));
            lbBanner.Controls.Add(new LiteralControl("<ul class=\"carousel-indicators\">"));
            for(i=0;i<iCount;i++)
            {
                if(i==0)
                {
                    lbBanner.Controls.Add(new LiteralControl("<li data-target=\"#demo\" data-slide-to=" + i + " class=\"active\"></li>"));
                }
                else
                {
                    lbBanner.Controls.Add(new LiteralControl("<li data-target=\"#demo\" data-slide-to=" + i + "></li>"));
                }
            }
            lbBanner.Controls.Add(new LiteralControl("</ul>"));
            lbBanner.Controls.Add(new LiteralControl("<div class=\"carousel-inner\">"));
            i = 0;
            foreach(DataRow r in dt.Rows)
            {
                if(i==0)
                {
                    lbBanner.Controls.Add(new LiteralControl("<div class=\"carousel-item active\">"));
                }
                else
                {
                    lbBanner.Controls.Add(new LiteralControl("<div class=\"carousel-item\">"));
                }
                lbBanner.Controls.Add(new LiteralControl("<img src=\"images/Home/banner/"+ r[0].ToString()+"\">"));
                lbBanner.Controls.Add(new LiteralControl("</div>"));
                i++;
            }
            lbBanner.Controls.Add(new LiteralControl("</div>"));
            lbBanner.Controls.Add(new LiteralControl("</div>"));

        }
    }
    private void Sale()
    {
        dlGiamGia.DataSource = XLDL.LayDuLieu("select * from DIENTHOAI where GiamGia <> 0");
        dlGiamGia.DataBind();
    }
    protected void dlHang_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataList dlDienThoai = (DataList)e.Item.FindControl("dlDienThoai");
        int macty = int.Parse(dlHang.DataKeys[e.Item.ItemIndex].ToString());
        dlDienThoai.DataSource = XLDL.LayDuLieu("select * from dienthoai where macty="+macty+" order by masp desc");
        dlDienThoai.DataBind();
    }

    protected void dlDienThoai_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbTraGop = (Label)e.Item.FindControl("lbTraGop");
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

        Label lbGiaban = (Label)e.Item.FindControl("lbGiaBan");
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