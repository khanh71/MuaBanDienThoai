using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DonHang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            donhang();
        }
    }
    private void donhang()
    {
        dlDonHang.DataSource = XLDL.LayDuLieu("select donhang.SoDH,TenNguoiNhan,DiaChiNhan,SDTNhan,sum(ThanhTien) as thanhtien,ThanhToan,DaGiao from DONHANG,CTDONHANG where DONHANG.SoDH=CTDONHANG.SoDH group by donhang.SoDH,TenNguoiNhan,ThanhToan,DaGiao,DiaChiNhan,SDTNhan order by donhang.sodh desc");
        dlDonHang.DataBind();
    }

    protected void dlDonHang_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int sodh = int.Parse(dlDonHang.DataKeys[e.Item.ItemIndex].ToString());
        Label lbthanhtoan = (Label)e.Item.FindControl("lbthanhtoan");
        CheckBox cb = (CheckBox)e.Item.FindControl("CheckBox1");
        DataTable dt = XLDL.LayDuLieu("select thanhtoan,dagiao from donhang where sodh=" + sodh);
        if(dt.Rows.Count>0)
        {
            if (dt.Rows[0][0].ToString() == "True")
                lbthanhtoan.Text = "Chuyển Khoản";
            else
                lbthanhtoan.Text = "Tiền Mặt";
            if (dt.Rows[0][1].ToString() == "True")
                cb.Checked = true;
            else
                cb.Checked = false;
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        foreach(DataListItem item in dlDonHang.Items)
        {
            int sodh = int.Parse(dlDonHang.DataKeys[item.ItemIndex].ToString());
            CheckBox cb = (CheckBox)item.FindControl("CheckBox1");
            int bit = 0;
            if (cb.Checked)
                bit = 1;
            XLDL.Chaylenh("update donhang set dagiao=" + bit + " where sodh=" + sodh);
        }
        donhang();
    }
}