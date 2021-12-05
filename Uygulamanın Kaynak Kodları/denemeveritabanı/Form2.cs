using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace denemeveritabanı
{
    public partial class Form2 : Form
    {

        //public static string gonderilecekveri;

        public Form2()
        {
            InitializeComponent();
           
        }

        public static string deger;

        NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");
       

        private void button2_Click(object sender, EventArgs e)
        {
            deger = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            Form5 f5 = new Form5();
            f5.ShowDialog();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Form5 f5 = new Form5();

            
        }

        public void DataDoldur()
        {
            DataSet dataSet = new DataSet();

            try
            {
                connection.Open();
            }

            catch (Exception ex)
            {
                throw;
            }

            string sql = "Select urunid as Ürün_Id, urunadi as Ürün_Adı, barkodno as Barkod_No, sonkullanmatarihi as SonKullanma_Tarihi, rafid as Raf_No,stok as Stok From public.\"Urun\"";


            NpgsqlDataAdapter add = new NpgsqlDataAdapter(sql, connection);
            add.Fill(dataSet);

            dataGridView1.DataSource = dataSet.Tables[0];
            connection.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataDoldur();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }
    }
}
