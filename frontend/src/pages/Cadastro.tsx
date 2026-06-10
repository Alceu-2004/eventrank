import { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Cadastro = () => {
  const navigate = useNavigate();
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState("");

  const validarCampos = () => {
    if (!nome || !email || !senha) {
      setErro("Todos os campos são obrigatórios.");
      return false;
    }
    if (senha.length < 6) {
      setErro("A senha deve ter no mínimo 6 caracteres.");
      return false;
    }
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      setErro("E-mail inválido.");
      return false;
    }
    return true;
  };

  const handleCadastro = async (e: React.FormEvent) => {
    e.preventDefault();
    setErro("");
    if (!validarCampos()) return;

    setLoading(true);
    try {
      await axios.post("http://localhost:8080/usuarios", { nome, email, senha });
      const tokenResponse = await axios.post("http://localhost:8080/login", { email, senha });
      sessionStorage.setItem("token", tokenResponse.data.token);
      sessionStorage.setItem("nomeUsuario", tokenResponse.data.nome ?? nome);
      navigate("/dashboard");
    } catch (error: any) {
      setErro(error.response?.data?.message || "Erro ao realizar cadastro.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="auth-page">
      <div className="auth-box fade-in">
        <div className="auth-box__logo">
          Event<span>Rank</span>
        </div>
        <p className="auth-box__subtitle">
          Comece a avaliar eventos hoje mesmo.
        </p>

        <div className="divider" />

        <p className="auth-box__title">Criar nova conta</p>

        {erro && <div className="error-msg">{erro}</div>}

        <form onSubmit={handleCadastro}>
          <div className="form-group">
            <div className="form-field">
              <label className="form-label" htmlFor="nome">Nome completo</label>
              <input
                id="nome"
                type="text"
                placeholder="Seu nome"
                value={nome}
                onChange={(e) => setNome(e.target.value)}
                autoComplete="name"
              />
            </div>

            <div className="form-field">
              <label className="form-label" htmlFor="email">E-mail</label>
              <input
                id="email"
                type="email"
                placeholder="voce@exemplo.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                autoComplete="email"
              />
            </div>

            <div className="form-field">
              <label className="form-label" htmlFor="senha">Senha</label>
              <input
                id="senha"
                type="password"
                placeholder="Mínimo 6 caracteres"
                value={senha}
                onChange={(e) => setSenha(e.target.value)}
                autoComplete="new-password"
              />
            </div>
          </div>

          <button
            type="submit"
            className="btn-primary"
            style={{ width: "100%" }}
            disabled={loading}
          >
            {loading ? "Criando conta..." : "Criar conta"}
          </button>
        </form>

        <p className="auth-footer">
          Já tem uma conta?{" "}
          <button className="btn-link" onClick={() => navigate("/login")}>
            Entrar
          </button>
        </p>
      </div>
    </div>
  );
};

export default Cadastro;
