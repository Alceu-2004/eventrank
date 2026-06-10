import { useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../services/api";

const Login = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [erro, setErro] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setErro("");

    if (!email || !senha) {
      setErro("Preencha todos os campos.");
      return;
    }

    setLoading(true);
    try {
      const response = await api.post("/login", { email, senha });
      sessionStorage.setItem("token", response.data.token);
      sessionStorage.setItem("nomeUsuario", response.data.nome);
      navigate("/dashboard");
    } catch {
      setErro("E-mail ou senha incorretos.");
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
          Avalie eventos. Descubra os melhores.
        </p>

        <div className="divider" />

        <p className="auth-box__title">Acesse sua conta</p>

        {erro && <div className="error-msg">{erro}</div>}

        <form onSubmit={handleLogin}>
          <div className="form-group">
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
                placeholder="••••••••"
                value={senha}
                onChange={(e) => setSenha(e.target.value)}
                autoComplete="current-password"
              />
            </div>
          </div>

          <button
            type="submit"
            className="btn-primary"
            style={{ width: "100%" }}
            disabled={loading}
          >
            {loading ? "Entrando..." : "Entrar"}
          </button>
        </form>

        <p className="auth-footer">
          Não tem conta?{" "}
          <button className="btn-link" onClick={() => navigate("/cadastro")}>
            Crie uma gratuitamente
          </button>
        </p>
      </div>
    </div>
  );
};

export default Login;
