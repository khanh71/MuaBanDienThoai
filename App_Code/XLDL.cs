using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

public class XLDL
{
    public static string Timkiem = "";
    public static string urlDangKy = "";
    private static string key = "khanh";
    public static string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();
    public static string MaHoa(string toEncrypt)
    {
        bool useHashing = true;
        byte[] keyArray;
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

        if (useHashing)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
        }
        else
            keyArray = UTF8Encoding.UTF8.GetBytes(key);

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        tdes.Key = keyArray;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateEncryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }
    public static string GiaiMa(string toDecrypt)
    {
        bool useHashing = true;
        byte[] keyArray;
        byte[] toEncryptArray = Convert.FromBase64String(toDecrypt);

        if (useHashing)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
        }
        else
            keyArray = UTF8Encoding.UTF8.GetBytes(key);

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        tdes.Key = keyArray;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

        return UTF8Encoding.UTF8.GetString(resultArray);
    }
    public static DataTable LayDuLieu(string lenhSQL)
    {
        SqlConnection sqlcon = new SqlConnection(strcon);
        SqlDataAdapter da = new SqlDataAdapter(lenhSQL, sqlcon);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    public static void Chaylenh(string lenhSQL)
    {
        try
        {
            using (SqlConnection sqlcon = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(lenhSQL, sqlcon);
                sqlcon.Open();
                cmd.ExecuteNonQuery();
                sqlcon.Close();
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
    public static bool CheckFileType(string fileName)
    {
        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower())
        {
            case ".gif":
                return true;
            case ".png":
                return true;
            case ".jpg":
                return true;
            case ".jpeg":
                return true;
            default:
                return false;
        }
    }
    public static void Crop(int width, int height, Stream str, string diachi)
    {
        System.Drawing.Image oImg = System.Drawing.Image.FromStream(str);
        double ratio = (1.0 * width) / (1.0 * height);
        double newW, newH, x, y;
        newW = oImg.Width * ratio;
        newH = oImg.Height;
        y = 0;
        x = (oImg.Width - newW) / 2;
        Rectangle part = new Rectangle((int)x, (int)y, (int)newW, (int)newH);
        Bitmap bmp = new Bitmap(part.Width, part.Height);
        bmp.SetResolution(oImg.VerticalResolution, oImg.HorizontalResolution);
        Graphics g = Graphics.FromImage(bmp);
        g.DrawImage(oImg, 0, 0, part, GraphicsUnit.Pixel);
        g.Dispose();
        bmp.Save(diachi);
        oImg.Dispose();
        bmp.Dispose();
    }
    public static void DeleteFolder(string path)
    {
        DirectoryInfo dir2delete = new DirectoryInfo(path);
        foreach (FileInfo file in dir2delete.GetFiles())
        {
            file.Delete();
        }
        foreach (DirectoryInfo dir in dir2delete.GetDirectories())
        {
            dir.Delete(true);
        }
        Directory.Delete(path);
    }
}
