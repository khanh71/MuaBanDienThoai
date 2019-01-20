using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KhuyenMaiCty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            deal();
        }
    }
    private void deal()
    {
        dlHinh.DataSource = XLDL.LayDuLieu("select khuyenmaicty.hinhanh,madeal,tencty from khuyenmaicty,congty where congty.macty=khuyenmaicty.macty");
        dlHinh.DataBind();
    }

    protected void dlHinh_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int id = int.Parse(dlHinh.DataKeys[e.Item.ItemIndex].ToString());
        CheckBox cbHinh = (CheckBox)e.Item.FindControl("cbHinh");
        DataTable dt = XLDL.LayDuLieu("select hien from khuyenmaicty where madeal=" + id);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0].ToString() == "True")
                cbHinh.Checked = true;
            else
                cbHinh.Checked = false;
        }
    }

    protected void ddlHangSX_Load(object sender, EventArgs e)
    {
        DataTable dt = XLDL.LayDuLieu("select tencty from congty");
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlHangSX.Items.Add(dt.Rows[i][0].ToString());
            }
        }
    }

    protected void dlHinh_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            int id = int.Parse(dlHinh.DataKeys[e.Item.ItemIndex].ToString());
            DataTable dt = XLDL.LayDuLieu("select khuyenmaicty.hinhanh,tencty from congty,khuyenmaicty where congty.macty=khuyenmaicty.macty and madeal=" + id);
            if (dt.Rows.Count > 0)
            {
                string tenfile = "~/images/" + dt.Rows[0][1].ToString() + "/" + dt.Rows[0][0].ToString();
                File.Delete(Server.MapPath(tenfile));
                XLDL.Chaylenh("delete from khuyenmaicty where madeal=" + id);
                deal();
            }
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Vui lòng thử lại sau')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            int bit = 0;
            foreach (DataListItem item in dlHinh.Items)
            {
                int id = int.Parse(dlHinh.DataKeys[item.ItemIndex].ToString());
                CheckBox cbHinh = (CheckBox)item.FindControl("cbHinh");
                if (cbHinh.Checked == true)
                    bit = 1;
                else
                    bit = 0;
                XLDL.Chaylenh("update khuyenmaicty set hien=" + bit + " where madeal=" + id);
            }
            DataTable dt = XLDL.LayDuLieu("select tencty,macty from congty where tencty='" + ddlHangSX.SelectedItem + "'");
            if (dt.Rows.Count > 0)
            {
                string tenhinh = "~/images/" + dt.Rows[0][0].ToString() + "/";
                HttpFileCollection fileCollection = Request.Files;
                for (int i = 0; i < fileCollection.Count; i++)
                {
                    HttpPostedFile uploadfile = fileCollection[i];
                    string fileName = Path.GetFileName(uploadfile.FileName);
                    if (uploadfile.ContentLength > 0)
                    {
                        string hinh = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fileName;
                        uploadfile.SaveAs(Server.MapPath(tenhinh) + hinh);
                        XLDL.Chaylenh("insert into khuyenmaicty(hinhanh,macty) values('" + hinh + "'," + int.Parse(dt.Rows[0][1].ToString()) + ")");
                    }
                }
            }
            deal();
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Vui lòng thử lại sau')</script>");
        }
    }
}