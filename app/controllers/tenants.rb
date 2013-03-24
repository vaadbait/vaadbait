Vaadbait::App.controllers :tenants do
  get :index do
    @title = "Tenants"
    @tenants = Tenant.all
    render 'tenants/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'tenant')
    @tenant = Tenant.new
    render 'tenants/new'
  end

  post :create do
    @tenant = Tenant.new(params[:tenant])
    if @tenant.save
      @title = pat(:create_title, :model => "tenant #{@tenant.id}")
      flash[:success] = pat(:create_success, :model => 'Tenant')
      params[:save_and_continue] ? redirect(url(:tenants, :index)) : redirect(url(:tenants, :edit, :id => @tenant.id))
    else
      @title = pat(:create_title, :model => 'tenant')
      flash.now[:error] = pat(:create_error, :model => 'tenant')
      render 'tenants/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "tenant #{params[:id]}")
    @tenant = Tenant.get(params[:id].to_i)
    if @tenant
      render 'tenants/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'tenant', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "tenant #{params[:id]}")
    @tenant = Tenant.get(params[:id].to_i)
    if @tenant
      if @tenant.update(params[:tenant])
        flash[:success] = pat(:update_success, :model => 'Tenant', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:tenants, :index)) :
          redirect(url(:tenants, :edit, :id => @tenant.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'tenant')
        render 'tenants/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'tenant', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Tenants"
    tenant = Tenant.get(params[:id].to_i)
    if tenant
      if tenant != current_account && tenant.destroy
        flash[:success] = pat(:delete_success, :model => 'Tenant', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'tenant')
      end
      redirect url(:tenants, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'tenant', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Tenants"
    unless params[:tenant_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'tenant')
      redirect(url(:tenants, :index))
    end
    ids = params[:tenant_ids].split(',').map(&:strip).map(&:to_i)
    tenants = Tenant.all(:id => ids)
    
    if tenants.include? current_account
      flash[:error] = pat(:delete_error, :model => 'tenant')
    elsif tenants.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Tenants', :ids => "#{ids.to_sentence}")
    end
    redirect url(:tenants, :index)
  end
end
