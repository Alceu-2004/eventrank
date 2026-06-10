import { useNavigate } from "react-router-dom";

interface HeaderProps {
  usuarioLogado?: string | null;
  onLogout?: () => void;
}

const Header = ({ usuarioLogado, onLogout }: HeaderProps) => {
  const navigate = useNavigate();

  return (
    <header className="site-header">
      <div
        className="site-header__logo"
        onClick={() => navigate("/dashboard")}
        role="button"
        tabIndex={0}
        onKeyDown={(e) => e.key === "Enter" && navigate("/dashboard")}
        aria-label="Ir para o início"
      >
        Event<span>Rank</span>
      </div>

      <nav className="site-header__nav">
        {usuarioLogado ? (
          <>
            <span className="nav-user-chip">{usuarioLogado}</span>
            <button className="btn-ghost" onClick={onLogout}>
              Sair
            </button>
          </>
        ) : (
          <>
            <button className="btn-ghost" onClick={() => navigate("/login")}>
              Entrar
            </button>
            <button className="btn-primary" onClick={() => navigate("/cadastro")}>
              Criar conta
            </button>
          </>
        )}
      </nav>
    </header>
  );
};

export default Header;
