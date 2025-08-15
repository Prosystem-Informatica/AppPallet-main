using AppPallet.Models;
using SQLite;
using System;
using System.Collections.Generic;
using System.Text;

namespace AppPallet
{
    class ControleRepository : IControleRepository
    {
        DatabaseHelper _databaseHelper;
        public ControleRepository()
        {
            _databaseHelper = new DatabaseHelper();
        }

        //Inserir dados
        public void InsertLogin(Login login)
        {
            _databaseHelper.InsertLogin(login);
        }
        public void InsertLoginAcesso(LoginAcesso loginAcesso)
        {
            _databaseHelper.InsertLoginAcesso(loginAcesso);
        }
        // Inserir dados VerificaCarga
        public void InsertVerificaCarga(VerificaCarga verificaCarga)
        {
            _databaseHelper.InsertVerificaCarga(verificaCarga);
        }
        // Atualizar dados Login
        public void UpdateLogin(Login login)
        {
            _databaseHelper.UpdateLogin(login);
        }

        // Atualizar dados LoginAcesso
        public void UpdateLoginAcesso(LoginAcesso loginAcesso)
        {
            _databaseHelper.UpdateLoginAcesso(loginAcesso);
        }
        // Atualizar dados VerificaCarga
        public void UpdateVerificaCarga(VerificaCarga verificaCarga) 
        {
            _databaseHelper.UpdateVerificaCarga(verificaCarga);
        }
        // Pegar todos dados
        public List<Login> GetAllLoginData()
        {
            return _databaseHelper.GetAllLoginData();
        }
        public List<LoginAcesso> GetAllLoginAcessoData()
        {
            return _databaseHelper.GetAllLoginAcessoData();
        }
        public List<VerificaCarga> GetAllVerificaCargaData()
        {
            return _databaseHelper.GetAllVerificaCargaData();
        }
        // Pegar dados especifico por id
        public Login GetLoginByCodigo(string id)
        {
            return _databaseHelper.GetLoginByCodigo(id);
        }
        public LoginAcesso GetLoginAcessoByCodigo(string id)
        {
            return _databaseHelper.GetLoginAcessoByCodigo(id);
        }
        public VerificaCarga GetVerificaCargaByCodigo(string id)
        {
            return _databaseHelper.GetVerificaCargaByCodigo(id);
        }
        // Deletar todos dado
        public void DeleteAllLogin()
        {
            _databaseHelper.DeleteAllLogin();
        }
        public void DeleteAllLoginAcesso()
        {
            _databaseHelper.DeleteAllLoginAcesso();
        }
        public void DeleteAllVerificaCarga()
        {
            _databaseHelper.DeleteAllVerificaCarga();
        }
        // Deletar um dado especifico por id
        public void DeleteLogin(int id)
        {
            _databaseHelper.DeleteLogin(id);
        }
        public void DeleteLoginAcesso(int id)
        {
            _databaseHelper.DeleteLoginAcesso(id);
        }
        public void DeleteVerificaCarga(int id)
        {
            _databaseHelper.DeleteVerificaCarga(id);
        }
    }
}
