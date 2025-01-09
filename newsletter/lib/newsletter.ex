defmodule Newsletter do
  def read_emails(path) do
    # Please implement the read_emails/1 function
    {:ok, body} = File.read(path)
    String.split(body, "\n", trim: true)
  end

  def open_log(path) do
    # Please implement the open_log/1 function
    {:ok, pid} = File.open(path, [:write])
    pid
  end

  def log_sent_email(pid, email) do
    # Please implement the log_sent_email/2 function
    IO.puts(pid, email)
  end

  def close_log(pid) do
    # Please implement the close_log/1 function
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    # Please implement the send_newsletter/3 function
    emails = read_emails(emails_path)
    pid = open_log(log_path)

    Enum.each(
      emails,
      fn email ->
        if send_fun.(email) == :ok do
          log_sent_email(pid, email)
        end
      end
    )

    close_log(pid)
  end
end
