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
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }


        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
        
            
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            textBox3.Text = Form2.deger;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

            NpgsqlConnection connection = new NpgsqlConnection("Server=localhost; Port=5432; Database=veri; User Id=postgres; Password=admin;");

            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                string kayit = "insert into public.\"Musteri\"(kisiid, adi, soyadi, kisituru) values (@kisiid,@adi,@soyadi,@kisituru)";


                NpgsqlCommand komut = new NpgsqlCommand(kayit, connection);

                komut.Parameters.AddWithValue("@adi", textBox1.Text);
                komut.Parameters.AddWithValue("@soyadi", textBox2.Text);
                komut.Parameters.AddWithValue("@kisiid", numericUpDown1.Value);
                komut.Parameters.AddWithValue("@kisituru", textBox4.Text);
                
               

                komut.ExecuteNonQuery();
                connection.Close();

                MessageBox.Show("Ürün alındı.", "Bilgilendirme");
            }

            catch (Exception hata)
            {
                MessageBox.Show("İşlem Sırasında Hata Oluştu." + hata.Message);
            }
        }
    }
}
