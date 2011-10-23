Deface::Override.new(:virtual_path  => "layouts/spree_application",
         :replace => "div#logo",
         :text => '<ul id="articles-bar">
        <li><%= link_to "About Bitspudlo.com", "/about_store" %></li>
        <li><%= link_to "Before Ordering", "/before_ordering" %></li>
        <li><%= link_to "Contact", "/contact" %></li>
        <li>currency: 
          <%= link_to "PLN", "/currency/PLN" %>
          <%= link_to "EUR", "/currency/EUR" %>
          <%= link_to "USD", "/currency/USD" %>
        </li>
      </ul>
      <%= logo %>',
         :name    => "articles_bar")