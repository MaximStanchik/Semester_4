using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlClient;

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для MessagePromo.xaml
    /// </summary>
    public partial class MessagePromo : Window
    {
        public MessagePromo()
        {
            InitializeComponent();
            LoadImageFromDatabase(); 
        }

        private int currentPromoID = 1;

        private void LoadImageFromDatabase()
        {
            string query = "SELECT PromoImage FROM Promotions WHERE PromoID = @PromoID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                currentPromoID = new Random().Next(1, 4);

                command.Parameters.AddWithValue("@PromoID", currentPromoID);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    byte[] imageData = (byte[])reader["PromoImage"];

                    BitmapImage bitmapImage = new BitmapImage();
                    using (MemoryStream memoryStream = new MemoryStream(imageData))
                    {
                        bitmapImage.BeginInit();
                        bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                        bitmapImage.StreamSource = memoryStream;
                        bitmapImage.EndInit();
                    }

                    image1.Fill = new ImageBrush(bitmapImage);
                }
            }
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
    }
}
