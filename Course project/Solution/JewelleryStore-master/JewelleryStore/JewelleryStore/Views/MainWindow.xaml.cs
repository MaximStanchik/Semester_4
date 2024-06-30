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
using System.Threading;
using System.Collections.ObjectModel;
using System.IO;
using MaterialDesignThemes.Wpf;
using JewelleryStore.MessageWindows;

namespace JewelleryStore
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void SpecialOffersButton_Click(object sender, RoutedEventArgs e)
        {
            MessageWindows.MessagePromo messageWindow = new MessageWindows.MessagePromo();
            messageWindow.ShowDialog();
        }
        private void FavBtnClick(object sender, RoutedEventArgs e)
        {
            AllPromotions window = new AllPromotions();
            window.ShowDialog();
        }
    }
}
