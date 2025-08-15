using AppPallet.Models;
using SQLite;
using System;
using System.Collections.Generic;
using System.Text;

namespace AppPallet
{
    public interface IControleRepository
    {
        //Inserir dados
        void InsertLogin(Login login);
        void InsertLoginAcesso(LoginAcesso loginAcesso);
        // Inserir dados VerificaCarga
        void InsertVerificaCarga(VerificaCarga verificaCarga);
        // Atualizar dados Login
        void UpdateLogin(Login login);
        // Atualizar dados LoginAcesso
        void UpdateLoginAcesso(LoginAcesso loginAcesso);
        // Atualizar dados VerificaCarga
        void UpdateVerificaCarga(VerificaCarga verificaCarga);
        // Pegar todos dados
        List<Login> GetAllLoginData();
        List<LoginAcesso> GetAllLoginAcessoData();
        List<VerificaCarga> GetAllVerificaCargaData();
        // Pegar dados especifico por id
        Login GetLoginByCodigo(string id);
        LoginAcesso GetLoginAcessoByCodigo(string id);
        VerificaCarga GetVerificaCargaByCodigo(string id);
        // Deletar todos dado
        void DeleteAllLogin();
        void DeleteAllLoginAcesso();
        void DeleteAllVerificaCarga();
        // Deletar um dado especifico por id
        void DeleteLogin(int id);
        void DeleteLoginAcesso(int id);
        void DeleteVerificaCarga(int id);
    }
}
