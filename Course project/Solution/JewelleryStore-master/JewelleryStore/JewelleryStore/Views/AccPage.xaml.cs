using JewelleryStore.MessageWindows;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace JewelleryStore.Views
{
    /// <summary>
    /// Логика взаимодействия для AccPage.xaml
    /// </summary>
    public partial class AccPage : Page
    {
        public List<User> Users { get; set; }
        public AccPage()
        {
            InitializeComponent();
            DataContext = this;
            LoadDataFromDatabase();
        }
        private void EditActivity(User user)
        {
            // Изменение значения в столбце "isActive"
            user.IsActive = !user.IsActive;
        }
        private void LoadDataFromDatabase()
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string query = "SELECT UserID, NickName, isActive, Access FROM USERS WHERE Access = 'admin';";

            Users = new List<User>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int userID = reader.GetInt32(0);
                    string nickName = reader.GetString(1);
                    bool isActive = reader.GetBoolean(2);
                    string ClientAccess = reader.GetString(3);

                    Users.Add(new User { UserID = userID, NickName = nickName, IsActive = isActive, Access = ClientAccess });
                }
            }
        }
        private void DeleteAccountFromDatabase(User user)
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string query = $"DELETE FROM USERS WHERE UserID = {user.UserID}";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
            }
        }
        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            Button deleteButton = (Button)sender;
            User user = (User)deleteButton.DataContext;

            // Удаление аккаунта из базы данных
            DeleteAccountFromDatabase(user);

            // Обновление данных в таблице
            LoadDataFromDatabase();

            // Перезагрузка текущей страницы
            NavigationService?.Refresh();

            WindowDeleteAdmin deleteAdminWindow = new WindowDeleteAdmin();
            deleteAdminWindow.ShowDialog(); // Вызов ShowDialog для модального окна
        }
    }

    public class User
    {
        public int UserID { get; set; }
        public string NickName { get; set; }
        public bool IsActive { get; set; }
        public string Access { get; set; }
        public bool IsAdmin { get; set; }
    }

}

