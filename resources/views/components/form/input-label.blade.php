@props(['value','required'=>false])
<label class="form-label">
    {{ $value ?? $slot }}{!! $required?'<span class="text-danger">*</span>':'' !!}
</label>
