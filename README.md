# 🧾 ProjetoExtração – Extrator de Dados de Arquivos .PLT do ANATEM

Este software foi desenvolvido em Lazarus com o objetivo de facilitar a **extração e organização dos dados contidos em arquivos `.plt`** gerados pelo sistema ![ANATEM](ANATEM) (Análise de Transitórios Eletromecânicos) do ![CEPEL](https://www.cepel.br/). Ele permite ao usuário selecionar parâmetros específicos e salvar os dados extraídos de forma prática.

---

## 🖼️ Interface do Programa

### Tela Inicial:

Tela Inicial

- Permite escolher o arquivo `.plt` de entrada.
- Opção de extrair todos os parâmetros ou selecionar apenas alguns.
- Botão para executar a conversão e salvar os dados extraídos.

### Tela de Seleção de Parâmetros:

Seleção de Parâmetros]

- Lista todos os parâmetros disponíveis no arquivo `.plt`.
- O usuário pode marcar os desejados.
- Mostra o total de parâmetros selecionados para conferência.

---

## ⚙️ Funcionalidades

- Leitura de arquivos `.plt` gerados pelo ANATEM.
- Interface simples e intuitiva.
- Seleção de todos os parâmetros ou de apenas os desejados.
- Exportação dos dados extraídos em arquivo .m, que pode ser lido diretamente no MatLab.

---

## 📦 Executável

Uma versão compilada (`.exe`) está disponível na seção [Releases](../../releases) para facilitar testes sem necessidade de compilação manual.

> ⚠️ Atenção: O executável foi gerado em 2015 e pode apresentar incompatibilidade com versões modernas do Windows.

---

## 💻 Tecnologias utilizadas

- **Lazarus IDE**
- **Free Pascal (Object Pascal)**

---

## 📁 Estrutura dos Arquivos

- `*.pas`, `*.lfm` – Arquivos-fonte do projeto Lazarus
- `.exe` – Arquivo executável (disponível na release)
- `.plt` – Arquivos de entrada suportados pelo software
- `.m` – Arquivos de saída gerado pelo software (o tipo de arquivo pode ser altereado diretamente so salvar o arquivo)

---

## 📜 Licença

Este projeto foi criado para fins acadêmicos/didáticos. Consulte o autor para usos comerciais ou modificações.

---

## 🤝 Contribuições

Sinta-se à vontade para abrir *issues* ou enviar *pull requests* com melhorias, correções ou sugestões.

---

## 👤 Autor

**Bernard Carvalho Bernardes**  
Universidade Federal do Pará (UFPA)  
Contato: [bcbernardes@ufpa.br]
