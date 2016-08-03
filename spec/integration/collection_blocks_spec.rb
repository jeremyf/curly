describe "Collection blocks", type: :request do
  example "Rendering collections" do
    get '/collection'

    expect(response.body).to eq <<-HTML.strip_heredoc
      <html>
      <head>
        <title>Dummy app</title>
      </head>
      <body>
      <header>
        <h1>Dummy app</h1>
      </header>
      <ul>

        <li>uno</li>
        <ul>
          <li>1</li><li>2</li><li>3</li>
        </ul>

        <li>dos</li>
        <ul>
          <li>1</li><li>2</li><li>3</li>
        </ul>

        <li>tres!</li>
        <ul>
          <li>1</li><li>2</li><li>3</li>
        </ul>

      </ul>

      </body>
      </html>
    HTML
  end
end
