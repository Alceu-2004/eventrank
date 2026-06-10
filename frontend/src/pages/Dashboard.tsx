import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { Search, ArrowRight, ChevronLeft, Star } from "lucide-react";
import Header from "../components/Header";
import CenteredLayout from "../components/CenteredLayout";

interface Usuario {
  id: number;
  nome: string;
}

interface Avaliacao {
  id: number;
  comentario: string;
  nota: number;
  usuario: Usuario | null;
}

interface Evento {
  id: number;
  nome: string;
  descricao?: string;
}

const StarDisplay = ({ nota }: { nota: number }) => (
  <div className="review-card__stars" aria-label={`${nota} de 5 estrelas`}>
    {[1, 2, 3, 4, 5].map((i) => (
      <span key={i} className={`star${i <= nota ? " filled" : ""}`}>★</span>
    ))}
  </div>
);

const StarInput = ({
  value,
  onChange,
}: {
  value: number;
  onChange: (n: number) => void;
}) => (
  <div className="star-input" role="group" aria-label="Selecionar nota">
    {[1, 2, 3, 4, 5].map((i) => (
      <button
        key={i}
        type="button"
        className={`star-btn${i <= value ? " active" : ""}`}
        onClick={() => onChange(i)}
        aria-label={`${i} estrela${i > 1 ? "s" : ""}`}
      >
        ★
      </button>
    ))}
  </div>
);

const Dashboard = () => {
  const [eventos, setEventos] = useState<Evento[]>([]);
  const [selecionado, setSelecionado] = useState<Evento | null>(null);
  const [avaliacoes, setAvaliacoes] = useState<Avaliacao[]>([]);
  const [comentario, setComentario] = useState("");
  const [nota, setNota] = useState(5);
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState("");
  const [filtro, setFiltro] = useState("");
  const [usuarioLogado, setUsuarioLogado] = useState<string | null>(null);

  const navigate = useNavigate();

  useEffect(() => {
    const token = sessionStorage.getItem("token");
    const nome = sessionStorage.getItem("nomeUsuario");
    setUsuarioLogado(token && nome ? nome : null);
    carregarEventos();
  }, []);

  useEffect(() => {
    if (selecionado) carregarAvaliacoes(selecionado.id);
  }, [selecionado]);

  const carregarEventos = async () => {
    try {
      const res = await axios.get("http://localhost:8080/eventos");
      setEventos(res.data);
    } catch {
      setErro("Não foi possível carregar os eventos.");
    }
  };

  const carregarAvaliacoes = async (eventoId: number) => {
    try {
      const token = sessionStorage.getItem("token");
      const headers = token ? { Authorization: `Bearer ${token}` } : {};
      const res = await axios.get(`http://localhost:8080/avaliacoes/${eventoId}`, { headers });
      setAvaliacoes(res.data);
    } catch {
      setErro("Não foi possível carregar as avaliações.");
    }
  };

  const enviarAvaliacao = async () => {
    const token = sessionStorage.getItem("token");
    if (!token) {
      navigate("/login");
      return;
    }
    if (!selecionado || !comentario.trim()) {
      setErro("Escreva um comentário antes de enviar.");
      return;
    }

    setLoading(true);
    setErro("");
    try {
      await axios.post(
        `http://localhost:8080/avaliacoes/${selecionado.id}`,
        { comentario, nota },
        { headers: { Authorization: `Bearer ${token}` } }
      );
      setComentario("");
      setNota(5);
      carregarAvaliacoes(selecionado.id);
    } catch (err: any) {
      setErro(err.response?.data?.message || "Erro ao enviar avaliação.");
    } finally {
      setLoading(false);
    }
  };

  const voltarLista = () => {
    setSelecionado(null);
    setAvaliacoes([]);
    setComentario("");
    setNota(5);
    setErro("");
  };

  const logout = () => {
    sessionStorage.clear();
    setUsuarioLogado(null);
    voltarLista();
  };

  const eventosFiltrados = eventos.filter((e) =>
    e.nome.toLowerCase().includes(filtro.toLowerCase())
  );

  const mediaNotas =
    avaliacoes.length > 0
      ? (avaliacoes.reduce((sum, a) => sum + a.nota, 0) / avaliacoes.length).toFixed(1)
      : null;

  return (
    <>
      <Header usuarioLogado={usuarioLogado} onLogout={logout} />

      <CenteredLayout>
        {erro && <div className="error-msg fade-in">{erro}</div>}

        {!selecionado ? (
          <div className="fade-in">
            <p className="section-eyebrow">Plataforma de avaliações</p>
            <h1 className="page-title">Eventos</h1>
            <p className="page-meta">
              {eventos.length > 0
                ? `${eventos.length} evento${eventos.length > 1 ? "s" : ""} disponíve${eventos.length > 1 ? "is" : "l"}`
                : "Carregando eventos..."}
            </p>

            <div className="search-wrap">
              <Search size={16} />
              <input
                type="text"
                placeholder="Pesquisar eventos..."
                value={filtro}
                onChange={(e) => setFiltro(e.target.value)}
                aria-label="Pesquisar eventos"
              />
            </div>

            {eventosFiltrados.length === 0 ? (
              <div className="empty-state">
                <div className="empty-state__icon">🔍</div>
                <p className="empty-state__text">Nenhum evento encontrado para "{filtro}"</p>
              </div>
            ) : (
              <ul className="event-list">
                {eventosFiltrados.map((e) => (
                  <li
                    key={e.id}
                    className="event-item"
                    onClick={() => setSelecionado(e)}
                    role="button"
                    tabIndex={0}
                    onKeyDown={(ev) => ev.key === "Enter" && setSelecionado(e)}
                    aria-label={`Ver avaliações de ${e.nome}`}
                  >
                    <span className="event-item__name">{e.nome}</span>
                    <ArrowRight size={16} className="event-item__arrow" />
                  </li>
                ))}
              </ul>
            )}
          </div>
        ) : (
          <div className="fade-in">
            <button className="back-link" onClick={voltarLista}>
              <ChevronLeft size={16} />
              Voltar para eventos
            </button>

            <p className="section-eyebrow">Avaliações</p>
            <h1 className="page-title">{selecionado.nome}</h1>

            {mediaNotas && (
              <p className="page-meta" style={{ display: "flex", alignItems: "center", gap: 6 }}>
                <Star size={14} style={{ color: "var(--color-star)" }} />
                <strong style={{ color: "var(--color-text)" }}>{mediaNotas}</strong>
                <span>/ 5 · {avaliacoes.length} avaliação{avaliacoes.length > 1 ? "ões" : ""}</span>
              </p>
            )}

            {selecionado.descricao && (
              <p style={{ color: "var(--color-text-dim)", fontSize: 14, marginBottom: "1.5rem" }}>
                {selecionado.descricao}
              </p>
            )}

            {avaliacoes.length === 0 ? (
              <div className="empty-state" style={{ marginBottom: "1.5rem" }}>
                <div className="empty-state__icon">💬</div>
                <p className="empty-state__text">Nenhuma avaliação ainda. Seja o primeiro!</p>
              </div>
            ) : (
              <ul className="reviews-list" style={{ marginBottom: "1.5rem" }}>
                {avaliacoes.map((a) => (
                  <li key={a.id} className="review-card">
                    <div className="review-card__header">
                      <span className="review-card__author">
                        {a.usuario?.nome || "Usuário anônimo"}
                      </span>
                      <StarDisplay nota={a.nota} />
                    </div>
                    <p className="review-card__text">{a.comentario}</p>
                  </li>
                ))}
              </ul>
            )}

            <div className="review-form">
              <p className="review-form__title">
                {usuarioLogado ? "Deixe sua avaliação" : "Faça login para avaliar"}
              </p>

              {!usuarioLogado ? (
                <button className="btn-primary" onClick={() => navigate("/login")}>
                  Entrar para avaliar
                </button>
              ) : (
                <>
                  <label className="form-label" style={{ marginBottom: 8 }}>Sua nota</label>
                  <StarInput value={nota} onChange={setNota} />

                  <label className="form-label" htmlFor="comentario" style={{ marginBottom: 6 }}>
                    Comentário
                  </label>
                  <textarea
                    id="comentario"
                    value={comentario}
                    onChange={(e) => setComentario(e.target.value)}
                    placeholder="Conte como foi o evento..."
                    style={{ marginBottom: 12 }}
                  />

                  <button
                    className="btn-primary"
                    onClick={enviarAvaliacao}
                    disabled={loading}
                  >
                    {loading ? "Enviando..." : "Publicar avaliação"}
                  </button>
                </>
              )}
            </div>
          </div>
        )}
      </CenteredLayout>
    </>
  );
};

export default Dashboard;
