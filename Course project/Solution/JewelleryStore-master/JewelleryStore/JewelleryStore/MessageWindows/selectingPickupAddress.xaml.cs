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
using System.Windows.Shapes;

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для selectingPickupAddress.xaml
    /// </summary>
    public partial class selectingPickupAddress : Window
    {
        MainWindowViewModel mainWindowViewModel = new MainWindowViewModel();

        private string comment;
        private string selectedAddress;
        private string[] addressParts;
        string restaurantStreet;
        string restaurantHouse;
        public selectingPickupAddress()
        {
            InitializeComponent();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            comment = CommentTextBox.Text;

            ComboBoxItem selectedItem = (ComboBoxItem)StatusComboBox.SelectedItem;
            selectedAddress = selectedItem.Content.ToString();
            addressParts = selectedAddress.Split(',');

            if (selectedAddress == "Выбрать адрес" || selectedAddress == "Select adress")
            {
                AdressError window = new AdressError();
                window.Show();
            }
            else
            {
                if (addressParts.Length == 2)
                {
                    restaurantStreet = addressParts[0].Trim();
                    restaurantHouse = addressParts[1].Trim(); 
                }
                mainWindowViewModel.CreateAnOrder("Minsk", "Не указано", "Не указано", 0, restaurantStreet, "Самовывоз", "В ожидании", comment, restaurantHouse);
                Close();
            }
        }
    }
}
