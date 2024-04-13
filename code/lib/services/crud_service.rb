require_relative '../models/contact'

class CRUDService
  def add_contact(name, phone)
    contact = Contact.new(name: name, phone: phone)
    if contact.save
      "Contato adicionado com sucesso."
    else
      "Erro ao adicionar contato: #{contact.errors.full_messages.join(', ')}"
    end
  end

  def list_contacts
    Contact.all.map { |contact| "#{contact.id}: #{contact.name}, #{contact.phone}" }
  end
 
  def update_contact(id, name, phone)
    return "ID inválido." unless valid_object_id?(id)
    contact = Contact.find(id)
    if contact.update(name: name, phone: phone)
      "Contato atualizado com sucesso."
    else
      "Erro ao atualizar contato: #{contact.errors.full_messages.join(', ')}"
    end
  end

  def delete_contact(id)
    contact = Contact.find(id)
    if contact.destroy
      "Contato deletado com sucesso."
    else
      "Erro ao deletar contato."
    end
  end

  def valid_object_id?(id)
    !!id.match(/\A[a-f0-9]{24}\z/i)
  end

end
