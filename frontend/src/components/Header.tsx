import { useState } from "react";
import { Menu, X } from "lucide-react";
import { useNavigate } from "react-router-dom";

const Header = () => {
  const [menuAberto, setMenuAberto] = useState(false);
  const navigate = useNavigate();

  const toggleMenu = () => setMenuAberto(!menuAberto);

  const handleLogout = () => {
    sessionStorage.removeItem("token");
    navigate("/login");
  };

  return (
    <header className="fixed top-0 left-0 w-full bg-blue-700 text-white shadow-md z-50">
      <div className="flex justify-between items-center px-6 py-3 relative">
        {/* Logo */}
        <h1 className="text-xl font-bold tracking-wide cursor-pointer" onClick={() => navigate("/dashboard")}>
          EventRank
        </h1>

        {/* Botão Menu */}
        <div className={`relative transition-all duration-300 ${menuAberto ? "-translate-x-8" : "translate-x-0"}`}>
          <button
            onClick={toggleMenu}
            className="p-2 rounded hover:bg-blue-600 transition"
          >
            {menuAberto ? <X size={26} /> : <Menu size={26} />}
          </button>

          {/* Menu Dropdown */}
          {menuAberto && (
            <div
              className="absolute top-0 right-[-180px] bg-white text-black rounded shadow-lg p-3 animate-slide-down w-[160px]"
            >
              <ul className="space-y-2">
                <li>
                  <button
                    onClick={() => navigate("/dashboard")}
                    className="block w-full text-left py-1 hover:text-blue-600"
                  >
                    Dashboard
                  </button>
                </li>
                <li>
                  <button
                    onClick={() => navigate("/relatorios")}
                    className="block w-full text-left py-1 hover:text-blue-600"
                  >
                    Relatórios
                  </button>
                </li>
                <li>
                  <button
                    onClick={handleLogout}
                    className="block w-full text-left py-1 text-red-500 hover:text-red-600"
                  >
                    Sair
                  </button>
                </li>
              </ul>
            </div>
          )}
        </div>
      </div>
    </header>
  );
};

export default Header;
