<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CRUD Cidades</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    >

    <style>
        body {
            background-color: #f4f6f9;
        }

        .card-form {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .table-container {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .titulo {
            font-weight: bold;
            color: #0d6efd;
        }

        .subtitulo {
            color: #6c757d;
        }

        .link-botao {
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container py-5">

    <div class="text-center mb-5">
        <h1 class="titulo">GERENCIAMENTO DE CIDADES</h1>
        <p class="subtitulo">
            Um CRUD para criar, alterar, excluir e listar cidades
        </p>
    </div>

    <div class="card card-form p-4 mb-5">

        <#if cidadeAtual??>
        <form action="/alterar" method="POST">
            <input type="hidden" name="nomeAtual" value="${(cidadeAtual.nome)!}">
            <input type="hidden" name="estadoAtual" value="${(cidadeAtual.estado)!}">
            <#else>
            <form action="/criar" method="POST">
                </#if>

                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label for="nome" class="form-label">Cidade</label>

                        <input
                                value="${(cidadeAtual.nome)!}"
                                name="nome"
                                type="text"
                                class="form-control"
                                placeholder="Informe o nome da cidade"
                                id="nome"
                                required
                        >
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="estado" class="form-label">Estado</label>

                        <input
                                value="${(cidadeAtual.estado)!}"
                                name="estado"
                                type="text"
                                class="form-control"
                                placeholder="Informe o estado ao qual a cidade pertence"
                                id="estado"
                                required
                        >
                    </div>

                </div>

                <div class="text-end">

                    <#if cidadeAtual??>
                        <a href="/" class="btn btn-secondary px-4">CANCELAR</a>

                        <button type="submit" class="btn btn-warning px-4">
                            CONCLUIR ALTERAÇÃO
                        </button>
                    <#else>
                        <button type="submit" class="btn btn-primary px-4">
                            CRIAR
                        </button>
                    </#if>

                </div>

            </form>
    </div>

    <div class="table-responsive table-container bg-white p-3">

        <table class="table table-hover align-middle mb-0">

            <thead class="table-dark">
            <tr>
                <th>Nome</th>
                <th>Estado</th>
                <th class="text-center">Ações</th>
            </tr>
            </thead>

            <tbody>
            <#list listaCidades as cidade>
                <tr>
                    <td>${cidade.nome}</td>
                    <td>${cidade.estado}</td>

                    <td>
                        <div class="d-flex justify-content-center gap-2">

                            <a
                                    href="/preparaAlterar?nome=${cidade.nome}&estado=${cidade.estado}"
                                    class="btn btn-warning btn-sm"
                            >
                                ALTERAR
                            </a>

                            <a
                                    href="/excluir?nome=${cidade.nome}&estado=${cidade.estado}"
                                    class="btn btn-danger btn-sm"
                            >
                                EXCLUIR
                            </a>

                        </div>
                    </td>
                </tr>
            </#list>
            </tbody>

        </table>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>