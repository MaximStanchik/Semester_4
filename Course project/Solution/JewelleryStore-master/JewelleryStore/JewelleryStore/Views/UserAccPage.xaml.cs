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
    /// Логика взаимодействия для UserAccPage.xaml
    /// </summary>
    public partial class UserAccPage : Page
    {
        public List<User> Users { get; set; }
        public UserAccPage()
        {
            InitializeComponent();
            DataContext = this;
            LoadDataFromDatabase();
        }
        private void LoadDataFromDatabase()
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string query = "SELECT UserID, NickName, isActive, Access FROM USERS WHERE Access = 'user' AND Access != 'banned';";

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
                    string clientAccess = reader.GetString(3);

                    Users.Add(new User
                    {
                        UserID = userID,
                        NickName = nickName,
                        IsActive = isActive,
                        Access = clientAccess
                    });
                }
            }
        }
        private void UpdateAccountInDatabase(User user)
        {
            string connectionString = "Server=localhost,1433;Database=AppDB;User Id=sa;Password=aaaa_1111;Trusted_Connection=False;MultipleActiveResultSets=true;TrustServerCertificate=True";
            string query = $"UPDATE USERS SET Access = 'banned' WHERE UserID = {user.UserID}";

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

            // Изменение значения Access на "banned"
            user.Access = "banned";

            // Обновление аккаунта в базе данных
            UpdateAccountInDatabase(user);

            // Обновление данных в таблице
            LoadDataFromDatabase();

            // Перезагрузка текущей страницы
            NavigationService?.Refresh();

            // Открытие окна WindowDeleteAdmin
            WindowBanUser banUserWindow = new WindowBanUser();
            banUserWindow.ShowDialog();
        }
    }
}



